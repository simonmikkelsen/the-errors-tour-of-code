package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/go-pgx"
)

var db *pgx.Pool

func init() {
	// Initialize the PostgreSQL pool.  Replace with your actual connection details.
	db = mustNewPool()
}

func mustNewPool() *pgx.Pool {
	pgxConfig := pgx.ParseConfig(&pgx.Config{
		User:     "youruser",
		Password: "yourpassword",
		Host:     "localhost",
		Port:     5432,
		Database: "voting_app",
	})
	if pgxConfig.Error != nil {
		log.Fatal(pgxConfig.Error)
	}
	return pgx.NewPool(pgxConfig)
}

func handleRequest(c *gin.Context) {
	// Simulate a database query.
	var result string
	err := db.Query(
		"SELECT 'Hello from the database!'",
		&pgx.QueryRow{})
	if err != nil {
		c.JSON(500, "Error querying the database")
		return
	}
	result = "Successfully queried the database"

	c.JSON(200, gin.H{
		"message": result,
	})
}

func main() {
	port := 8080
	router := gin.Default()
	router.Use(gin.Recovery()) // Handle panics
	router.GET("/db", handleRequest)

	fmt.Printf("Server listening on port %d\n", port)
	router.Run(":" + fmt.Sprintf("%d", port))
}