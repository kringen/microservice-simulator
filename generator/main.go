package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log/slog"
	"os"
	"time"

	"github.com/google/uuid"
	rmq "github.com/kringen/message-center/rabbitmq"
	amqp "github.com/rabbitmq/amqp091-go"
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))

func createQueue(mc *rmq.MessageCenter, name string, durable bool, deleteUnused bool,
	exclusive bool, noWait bool, arguments map[string]interface{}) error {

	err := mc.CreateQueue(name, durable, deleteUnused, exclusive, noWait, arguments)
	if err != nil {
		return err
	}
	return nil
}

func publishMessage(messageCenter *rmq.MessageCenter, q string, message []byte) {
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	var err error
	err = messageCenter.Channel.PublishWithContext(ctx,
		"",    // exchange
		q,     // routing key
		false, // mandatory
		false, // immediate
		amqp.Publishing{
			ContentType: "application/json",
			Body:        message,
		})
	if err != nil {
		logger.Error(err.Error())
	}
	logger.Info(fmt.Sprintf(" [x] Sent %s\n", message))
}

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
	err = createQueue(&messageCenter, queueId.String(), false, false, false, false, nil)
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
	er, err := json.Marshal(employeeGetRequest)
	if err != nil {
		panic(err)
	}
	publishMessage(&messageCenter, queueName, er)

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
	time.Sleep(120) // Initial wait period
	for i := 0; i < attempts; i++ {
		publishMessage(&messageCenter, queueName, b)
		logger.Info(fmt.Sprintf("Publishing message %d", i))
		time.Sleep(interval)
	}

}
