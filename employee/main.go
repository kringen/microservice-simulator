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

func (e Employee) Create() {

}

func setupEmployeeTable(db *sql.DB) {
	// Create table
	createStatement := `
	CREATE TABLE IF NOT EXISTS employee 
	( 
		empid      SERIAL  PRIMARY KEY NOT NULL, 
		lastname        VARCHAR (20) NOT NULL, 
		firstname       VARCHAR (10) NOT NULL, 
		title           VARCHAR (30) NULL, 
		titleofcourtesy VARCHAR (25) NULL, 
		birthdate       TIMESTAMP NULL, 
		hiredate        TIMESTAMP NULL, 
		address         VARCHAR (60) NULL, 
		city            VARCHAR (15) NULL, 
		region          VARCHAR (15) NULL, 
		postalcode      VARCHAR (10) NULL, 
		country         VARCHAR (15) NULL, 
		phone       VARCHAR (24) NULL, 
		extension       VARCHAR (4) NULL, 
		photo           BYTEA NULL, 
		notes           TEXT NULL, 
		mgrid       INT NULL, 
		photopath       VARCHAR (255) NULL
	--   PRIMARY KEY ( empid ) 
  ); `
	_, err := db.Exec(createStatement)
	if err != nil {
		logger.Error(err.Error())
	}
}

func EmployeeReadListen(goChanEmployee chan string, messageCenter *rmq.MessageCenter, queue string) {
	// Listen for messages
	messages, err := messageCenter.ConsumeMessage(queue, "", true, false, false, false, nil)
	if err != nil {
		logger.Error(err.Error())
	}

	logger.Info("Successfully connected to RabbitMQ")
	logger.Info("Waiting for messages for create")
	for message := range messages {
		// Continue to receive messages
		logger.Info(fmt.Sprintf(" > Received message on %s: %s\n", queue, message.Body))
		var employeeGetRequest EmployeeGetRequest
		err := json.Unmarshal(message.Body, &employeeGetRequest)
		if err != nil {
			logger.Error(err.Error())
		}
		// Get employee info
		employee := Employee{
			EmpId: 1,
		}

		// Return data in reply message
		replyQueue := message.ReplyTo
		returnEmployee := ReturnEmployee{
			ReplyQueue:    replyQueue,
			CorrelationId: employeeGetRequest.CorrelationId,
			Employee:      employee,
		}
		b, err := json.Marshal(returnEmployee)
		if err != nil {
			logger.Error(err.Error())
		}
		messageCenter.PublishMessage(replyQueue, b, "", false, false, "text/plain", message.CorrelationId, "")
		//logger.Info(fmt.Sprintf("Mode: %s\n", config.Mode))
		//logger.Info(fmt.Sprintf("Objective: %s\n", config.Objective))
	}
}

func EmployeeCreateListen(goChanEmployee chan string, messageCenter *rmq.MessageCenter, queue string) {
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
		var employee Employee
		err := json.Unmarshal(message.Body, &employee)
		if err != nil {
			logger.Error(err.Error())
		}
		// Insert into database
		connection_string := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable", username, password, database)
		db, err := sql.Open(server, connection_string)
		if err != nil {
			logger.Error(err.Error())
		}
		defer db.Close()

		logger.Info("Connected to database")
		setupEmployeeTable(db)

		logger.Info("Table setup")
		_, err = db.Exec("INSERT INTO employee (firstname, lastname) VALUES ($1, $2)", employee.FirstName, employee.LastName)
		if err != nil {
			logger.Error(err.Error())
		}
		db.Close()
		//
		// Return employeeId
		returnEmployee := Employee{
			EmpId:     100,
			LastName:  "Bourne",
			FirstName: "Jason",
		}
		b, err := json.Marshal(returnEmployee)
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
	// Connect to database
	//server := "postgres"
	//connection_string := "user=myuser dbname=mydb sslmode=disable"
	//db = Connect(server, connection_string)
	lvl := new(slog.LevelVar)
	lvl.Set(slog.LevelDebug)
	// Establish messaging connection
	messageCenter := rmq.MessageCenter{}
	// Define RabbitMQ server URL.
	messageCenter.ServerUrl = os.Getenv("RABBIT_URL")
	channel := "employee"
	err := messageCenter.Connect(channel, 5, 10)
	if err != nil {
		logger.Error(err.Error())
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	err = messageCenter.CreateQueue("employee_create", false, false, false, false, nil)
	if err != nil {
		logger.Error(err.Error())
	}
	// Startup service channels
	goChanEmployeeCreate := make(chan string)
	go EmployeeCreateListen(goChanEmployeeCreate, &messageCenter, "employee_create")
	<-goChanEmployeeCreate
	/*
	   goChanEmployeeRead := make(chan string)
	   go EmployeeReadListen(goChanEmployeeRead, &messageCenter, "employee_read")
	   <-goChanEmployeeRead
	*/
	go forever()
	quitChannel := make(chan os.Signal, 1)
	signal.Notify(quitChannel, syscall.SIGINT, syscall.SIGTERM)
	<-quitChannel
}
