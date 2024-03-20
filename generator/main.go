package main

import (
	"log/slog"
	"os"

	rmq "github.com/kringen/message-center/rabbitmq"
)

var logger = slog.New(slog.NewJSONHandler(os.Stdout, nil))

func main() {
	lvl := new(slog.LevelVar)
	lvl.Set(slog.LevelInfo)
	messageCenter := rmq.MessageCenter{}
	messageCenter.ServerUrl = os.Getenv("RABBIT_URL")
	populateEmployee(messageCenter)
	populateProduct(messageCenter)

}
