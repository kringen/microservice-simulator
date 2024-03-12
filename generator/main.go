package main

import (
	"encoding/json"
	"fmt"
	"log/slog"
	"os"

	"github.com/google/uuid"

	rmq "github.com/kringen/message-center/rabbitmq"
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))

func main() {
	lvl := new(slog.LevelVar)
	lvl.Set(slog.LevelInfo)
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
	err := messageCenter.Connect("employee", 5, 10)
	if err != nil {
		logger.Error(err.Error())
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	stepOne := rmq.SagaStep{
		StepName:        "Create Employee",
		StepDescription: "Send create request to Employee service",
		QueueName:       "employee_create",
		ActionType:      "publish_and_confirm",
		ReplyQueueName:  uuid.New().String(),
	}

	/////////////////////////
	// TEST
	// Create a test create message
	employee := Employee{
		FirstName: "Jason",
		LastName:  "Bourne",
	}

	// Serialize to json
	b, _ := json.Marshal(employee)
	stepOne.DataObject = b
	employeeSaga.SagaSteps = append(employeeSaga.SagaSteps, stepOne)
	logger.Info("Starting Saga")
	employeeSaga.StartSaga(&messageCenter)
	logger.Info(fmt.Sprintf("Saga completed: %s", employeeSaga.CorrelationId))
	for _, step := range employeeSaga.SagaSteps {
		for _, stepResult := range step.Results {
			logger.Info(fmt.Sprintf("Step: %v", stepResult))
		}
	}
}
