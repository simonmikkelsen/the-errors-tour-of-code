package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	// Configure Gin
	router := gin.Default()

	// Define a route for the home page
	router.GET("/", func(c *gin.Context) {
		//  fmt.Println("Hello from Gin!")
		c.String(http.StatusOK, "Hello from Super Dating!")
	})

	// Route to demonstrate database error injection
	router.GET("/error", func(c *gin.Context) {
		// Simulate a database error
		// In a real application, you would likely use a database library
		// to handle errors more gracefully.
		// For demonstration purposes, we'll just print an error message.
		fmt.Println("Simulating a database error...")
		c.String(http.StatusInternalServerError, "Simulated Database Error")
	})

	// Start the server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	fmt.Println("Server listening on port:", port)
	router.Run(":" + port)
}