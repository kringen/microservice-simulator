package main

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"io"
	"os"

	"database/sql"

	"github.com/google/uuid"

	rmq "github.com/kringen/message-center/rabbitmq"
)

func populateProduct(messageCenter rmq.MessageCenter) {

	err := messageCenter.Connect("product", 5, 10)
	if err != nil {
		logger.Error(err.Error())
	}
	defer messageCenter.Connection.Close()
	defer messageCenter.Channel.Close()

	/////////////////////////
	// TEST
	// Create a test create message
	var productList []Product
	// Open the CSV file
	f, err := os.Open("/data/products.csv")
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
		tmpProduct := Product{
			QuantityPerUnit: sql.NullString{rec[4], true},
			ProductName:     rec[1],
		}
		logger.Info(fmt.Sprintf("Product: %v", tmpProduct))
		productList = append(productList, tmpProduct)

	}

	f.Close()
	for _, p := range productList {
		productSaga := rmq.Saga{
			SagaName:        "Create Product",
			SagaDescription: "Saga to create a product using the product service",
			ChannelName:     "product",
			CorrelationId:   uuid.New().String(),
		}

		stepOne := rmq.SagaStep{
			StepName:        "Step: Create Product",
			StepDescription: "Send create request to Product service",
			QueueName:       "product_create",
			ActionType:      "publish_and_confirm",
			ReplyQueueName:  uuid.New().String(),
		}

		// Serialize to json
		b, _ := json.Marshal(p)
		stepOne.DataObject = b
		productSaga.SagaSteps = append(productSaga.SagaSteps, stepOne)
		logger.Info("Starting Saga")
		productSaga.StartSaga(&messageCenter)
		logger.Info(fmt.Sprintf("Saga completed: %s", productSaga.CorrelationId))
		for _, step := range productSaga.SagaSteps {
			for _, stepResult := range step.Results {
				logger.Info(fmt.Sprintf("Step Result: %v", stepResult))
			}
		}
	}
}
