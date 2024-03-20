package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log/slog"
	"os"
	"os/signal"
	"syscall"
	"time"

	rmq "github.com/kringen/message-center/rabbitmq"

	//amqp "github.com/rabbitmq/amqp091-go"
	_ "github.com/lib/pq" // PostgreSQL driver
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))
var server = os.Getenv("DB_SERVER")     // postgres
var username = os.Getenv("DB_USER")     // myuser
var password = os.Getenv("DB_PASSWORD") // mypassword
var sslmode = os.Getenv("DB_SSLMODE")   // disable
var database = os.Getenv("DB_DATABASE") // mydb

func (e Customer) Create() {

}

func setupCustomerTable(db *sql.DB) {
	// Create table
	createStatement := `
	CREATE TABLE IF NOT EXISTS customer 
	( 
		customerid      		 SERIAL  PRIMARY KEY NOT NULL, 
		customername        	 VARCHAR (125) NOT NULL, 
		supplierid       	 INT NULL, 
		categoryid       	 INT NULL, 
		quantityperunit 	 INT NULL, 
		unitprice       	 INT NULL, 
		unitssinstock        INT NULL, 
		unitsonorder         INT NULL, 
		reorderlevel         INT NULL, 
		discontinued         BIT NULL
  ); `
	_, err := db.Exec(createStatement)
	if err != nil {
		logger.Error(err.Error())
	}
}

func CustomerCreateListen(goChanCustomer chan string, messageCenter *rmq.MessageCenter, queue string) {
	// Listen for messages
	messages, err := messageCenter.ConsumeMessage(queue, "", true, false, false, false, nil)
	if err != nil {
		logger.Error(err.Error())
	}

	logger.Info("Successfully connected to RabbitMQ")
	logger.Info("Waiting for messages for create")
	for message := range messages {
		// Continue to receive messages
		logger.Info(fmt.Sprintf(" > Received message on %s: %s", queue, message.Body))
		var customer Customer
		err := json.Unmarshal(message.Body, &customer)
		if err != nil {
			logger.Error(err.Error())
		}
		// Insert into database
		connection_string := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=%s", username, password, database, sslmode)
		db, err := sql.Open(server, connection_string)
		if err != nil {
			logger.Error(err.Error())
		}
		defer db.Close()

		logger.Info("Connected to database")
		setupCustomerTable(db)

		logger.Info("Table setup")
		_, err = db.Exec("INSERT INTO customer (customername) VALUES ($1)", customer.CompanyName)
		if err != nil {
			logger.Error(err.Error())
		}
		db.Close()
		//
		// Return customerId
		returnCustomer := Customer{
			CompanyName: "Test Company",
			CustId:      100,
		}
		b, err := json.Marshal(returnCustomer)
		if err != nil {
			logger.Error(err.Error())
		}
		// Publish reply message
		logger.Info(fmt.Sprintf(" > Publishing reply message on %s", message.ReplyTo))
		err = messageCenter.PublishMessage(message.ReplyTo, b, "", false, false, "text/plain", message.CorrelationId, "")
		if err != nil {
			logger.Error(err.Error())
		}
	}
}

func forever() {
	for {
		time.Sleep(1 * time.Second)
	}
}

func main() {
	lvl := new(slog.LevelVar)
	lvl.Set(slog.LevelDebug)
	// Establish messaging connection
	messageCenter := rmq.MessageCenter{}
	// Define RabbitMQ server URL.
	messageCenter.ServerUrl = os.Getenv("RABBIT_URL")
	channel := "customer"
	err := messageCenter.Connect(channel, 5, 10)
	if err != nil {
		logger.Error(err.Error())
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	err = messageCenter.CreateQueue("customer_create", false, false, false, false, nil)
	if err != nil {
		logger.Error(err.Error())
	}
	// Startup service channels
	goChanCustomerCreate := make(chan string)
	go CustomerCreateListen(goChanCustomerCreate, &messageCenter, "customer_create")
	<-goChanCustomerCreate
	/*
	   goChanCustomerRead := make(chan string)
	   go CustomerReadListen(goChanCustomerRead, &messageCenter, "customer_read")
	   <-goChanCustomerRead
	*/
	go forever()
	quitChannel := make(chan os.Signal, 1)
	signal.Notify(quitChannel, syscall.SIGINT, syscall.SIGTERM)
	<-quitChannel
}
