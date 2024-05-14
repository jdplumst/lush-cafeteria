package server

import (
	"fmt"
	"net/http"
	"os"
	"strconv"

	"github.com/jdplumst/lushcafeteria/server/internal/database"
)

type Server struct {
	port int
	db   database.Service
}

func NewServer() *http.Server {
	port, err := strconv.Atoi(os.Getenv("PORT"))
	if err != nil {
		port = 8080
	}

	NewServer := &Server{
		port: port,
		db:   database.New(),
	}

	server := &http.Server{
		Addr:    fmt.Sprintf(":%d", NewServer.port),
		Handler: NewServer.RegisterRoutes(),
	}

	return server
}
