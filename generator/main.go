package main

import (
	"encoding/json"
	"log/slog"
	"os"

	"github.com/google/uuid"

	rmq "github.com/kringen/message-center/rabbitmq"
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))

func main() {

	messageCenter := rmq.MessageCenter{}

	employeeSaga := rmq.Saga{
		SagaName:        "Create Employee",
		SagaDescription: "Saga to create an employee using the employee service",
		ChannelName:     "employee",
		CorrelationId:   uuid.New().String(),
	}

	// Connect to the channel
	// Establish messaging connection

	messageCenter.ServerUrl = os.Getenv("RABBIT_URL")
	err := messageCenter.Connect("employee", 5, 5)
	if err != nil {
		panic(err)
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	stepOne := rmq.SagaStep{
		StepName:        "Publish Create Employee",
		StepDescription: "Send create request to Employee service",
		QueueName:       "employee_create",
		ActionType:      "publish_and_confirm",
		ReplyQueueName:  uuid.New().String(),
	}
	logger.Info("Creating Saga step one")
	employeeSaga.SagaSteps = append(employeeSaga.SagaSteps, stepOne)

	/////////////////////////
	// TEST
	// Create a test create message
	employee := Employee{
		CorrelationId: employeeSaga.CorrelationId,
		FirstName:     "Jason",
		LastName:      "Bourne",
	}

	// Serialize to json
	b, _ := json.Marshal(employee)
	stepOne.DataObject = b
	logger.Info("Starting Saga")
	employeeSaga.StartSaga(&messageCenter)

}
