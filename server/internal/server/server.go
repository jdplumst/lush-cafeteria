package server

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/jdplumst/lushcafeteria/server/internal/db"
	"github.com/spf13/viper"
	_ "github.com/tursodatabase/go-libsql"
)

type Server struct {
	port int
	db   *db.Queries
}

type config struct {
	Port  string `mapstructure:"PORT"`
	Dburl string `mapstructure:"DB_URL"`
}

func LoadConfig() (c config, err error) {
	viper.AddConfigPath(".env")
	viper.SetConfigType("env")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()

	if err != nil {
		log.Fatal(err)
	}

	err = viper.Unmarshal(&c)

	return
}

func NewServer() *http.Server {
	viper.SetConfigFile(".env")
	err := viper.ReadInConfig()
	if err != nil {
		log.Fatal("error trying to read env file", err)
	}

	port := viper.GetInt("PORT")
	if port == 0 {
		port = 8080
	}

	dbUrl := viper.GetString("DB_URL")

	database, err := sql.Open("libsql", dbUrl)
	if err != nil {
		log.Fatal(err)
	}

	NewServer := &Server{
		port: port,
		db:   db.New(database),
	}

	server := &http.Server{
		Addr:    fmt.Sprintf(":%d", NewServer.port),
		Handler: NewServer.RegisterRoutes(),
	}

	return server
}
