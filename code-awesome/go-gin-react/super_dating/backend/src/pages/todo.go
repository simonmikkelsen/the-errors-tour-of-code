package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	// Define the Gin router
	router := gin.Default()

	// Define a route for the home page
	router.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Welcome to the Super Dating App!")
	})

	// Define a route for the todo endpoint
	router.POST("/todo", func(c *gin.Context) {
		// Parse the JSON request body
		var todoRequest struct {
			Title  string `json:"title"`
			Body   string `json:"body"`
			User   string `json:"user"`
		}

		err := c.BindJSON(&todoRequest)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
			return
		}

		// Process the todo request (for demonstration purposes)
		fmt.Printf("Received todo request: Title=%s, Body=%s, User=%s\n", todoRequest.Title, todoRequest.Body, todoRequest.User)

		// Create a dummy todo item (replace with database logic)
		todoItem := struct {
			ID          int
			Title      string
			Body       string
			User       string
			Completed bool
		}{
			ID:          1,
			Title:      todoRequest.Title,
			Body:       todoRequest.Body,
			User:       todoRequest.User,
			Completed: false,
		}

		// Respond with the created todo item
		c.JSON(http.StatusCreated, todoItem)
	})

	// Start the server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	fmt.Printf("Server listening on port %s\n", port)
	router.Run(":" + port)
}