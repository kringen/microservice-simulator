package main

import (
	"encoding/json"
	"fmt"
	"log/slog"
	"os"
	"time"

	"github.com/google/uuid"
	rmq "github.com/kringen/message-center/rabbitmq"
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))

func main() {

	// Connect to the channel
	// Establish messaging connection
	messageCenter := rmq.MessageCenter{}
	// Define RabbitMQ server URL.
	messageCenter.ServerUrl = os.Getenv("RABBIT_URL")
	channelName := "employee"
	queueName := "employee_create"
	err := messageCenter.Connect(channelName, 5, 5)
	if err != nil {
		panic(err)
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	logger.Info("Creating queue for employee reply...")
	queueId := uuid.New()

	err = messageCenter.CreateQueue(queueId.String(), false, false, false, false, nil)
	if err != nil {
		panic(err)
	}

	// Create a test read message
	correlationId := uuid.New()
	employeeGetRequest := EmployeeGetRequest{
		CorrelationId: correlationId.String(),
		ReplyQueue:    queueId.String(),
		EmpId:         "1",
	}
	egr, err := json.Marshal(employeeGetRequest)
	if err != nil {
		panic(err)
	}
	err = messageCenter.PublishMessage(queueName, egr, "", false, false, "text/plain")
	if err != nil {
		panic(err)
	}
	// Create a test create message
	employee := Employee{
		FirstName: "Jason",
		LastName:  "Bourne",
	}
	b, err := json.Marshal(employee)
	if err != nil {
		panic(err)
	}
	interval := time.Duration(1) * time.Second
	attempts := 500
	time.Sleep(120 * time.Second) // Initial wait period
	for i := 0; i < attempts; i++ {
		err = messageCenter.PublishMessage(queueName, b, "", false, false, "text/plain")
		if err != nil {
			panic(err)
		}
		logger.Info(fmt.Sprintf("Publishing message %d", i))
		time.Sleep(interval)
	}

}
