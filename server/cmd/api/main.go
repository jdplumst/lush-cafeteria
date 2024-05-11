package main

import (
	"fmt"

	"github.com/jdplumst/lushcafeteria/server/internal/server"
)

func main() {
	server := server.NewServer()

	err := server.ListenAndServe()
	if err != nil {
		fmt.Println("failed to listen to server", err)
	}
}
