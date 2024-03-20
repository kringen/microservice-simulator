package main

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"io"
	"os"

	"github.com/google/uuid"

	rmq "github.com/kringen/message-center/rabbitmq"
)

func populateEmployee(messageCenter rmq.MessageCenter) {

	err := messageCenter.Connect("employee", 5, 10)
	if err != nil {
		logger.Error(err.Error())
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	/////////////////////////
	// TEST
	// Create a test create message
	var employeeList []Employee
	// Open the CSV file
	f, err := os.Open("/data/employees.csv")
	if err != nil {
		panic(err)
	}
	defer f.Close() // Remember to close the file at the end of the program

	// Read CSV values using csv.Reader
	csvReader := csv.NewReader(f)
	_, err = csvReader.Read() // First line contains headers
	if err != nil {
		logger.Error(err.Error())
	}
	for {
		rec, err := csvReader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			logger.Error(err.Error())
		}
		tmpEmp := Employee{
			FirstName: rec[2],
			LastName:  rec[1],
		}
		logger.Info(fmt.Sprintf("Emp: %v", tmpEmp))
		employeeList = append(employeeList, tmpEmp)

	}

	f.Close()
	for _, e := range employeeList {
		employeeSaga := rmq.Saga{
			SagaName:        "Create Employee",
			SagaDescription: "Saga to create an employee using the employee service",
			ChannelName:     "employee",
			CorrelationId:   uuid.New().String(),
		}

		stepOne := rmq.SagaStep{
			StepName:        "Step: Create Employee",
			StepDescription: "Send create request to Employee service",
			QueueName:       "employee_create",
			ActionType:      "publish_and_confirm",
			ReplyQueueName:  uuid.New().String(),
		}

		// Serialize to json
		b, _ := json.Marshal(e)
		stepOne.DataObject = b
		employeeSaga.SagaSteps = append(employeeSaga.SagaSteps, stepOne)
		logger.Info("Starting Saga")
		employeeSaga.StartSaga(&messageCenter)
		logger.Info(fmt.Sprintf("Saga completed: %s", employeeSaga.CorrelationId))
		for _, step := range employeeSaga.SagaSteps {
			for _, stepResult := range step.Results {
				logger.Info(fmt.Sprintf("Step Result: %v", stepResult))
			}
		}
	}
}
