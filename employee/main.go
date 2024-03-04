package main

import (
	"encoding/json"
	"fmt"
	"log/slog"
	"os"

	rmq "github.com/kringen/message-center/rabbitmq"

	//amqp "github.com/rabbitmq/amqp091-go"
	_ "github.com/lib/pq" // PostgreSQL driver
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))

func (e Employee) Create() {

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
		logger.Info(fmt.Sprintf(" > Received message: %s\n", message.Body))
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
		replyQueue := employeeGetRequest.ReplyQueue
		returnEmployee := ReturnEmployee{
			ReplyQueue:    replyQueue,
			CorrelationId: employeeGetRequest.CorrelationId,
			Employee:      employee,
		}
		b, err := json.Marshal(returnEmployee)
		if err != nil {
			logger.Error(err.Error())
		}
		messageCenter.PublishMessage(replyQueue, b, "", false, false, "text/plain")
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
		logger.Info(fmt.Sprintf(" > Received message: %s\n", message.Body))
		var employee Employee
		err := json.Unmarshal(message.Body, &employee)
		if err != nil {
			logger.Error(err.Error())
		}
		//logger.Info(fmt.Sprintf("Mode: %s\n", config.Mode))
		//logger.Info(fmt.Sprintf("Objective: %s\n", config.Objective))
	}
}

func main() {
	// Connect to database
	//server := "postgres"
	//connection_string := "user=myuser dbname=mydb sslmode=disable"
	//db = Connect(server, connection_string)

	// Establish messaging connection
	messageCenter := rmq.MessageCenter{}
	// Define RabbitMQ server URL.
	messageCenter.ServerUrl = os.Getenv("RABBIT_URL")
	channel := "employee"
	err := messageCenter.Connect(channel, 5, 5)
	if err != nil {
		panic(err)
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	logger.Info("Creating queue for employee_create...")
	err = messageCenter.CreateQueue("employee_create", false, false, false, false, nil)
	if err != nil {
		panic(err)
	}
	// Startup service channels
	logger.Info("Starting Services...")
	goChanEmployeeCreate := make(chan string)
	go EmployeeCreateListen(goChanEmployeeCreate, &messageCenter, "employee_create")
	<-goChanEmployeeCreate

	goChanEmployeeRead := make(chan string)
	go EmployeeReadListen(goChanEmployeeRead, &messageCenter, "employee_read")
	<-goChanEmployeeRead

}
