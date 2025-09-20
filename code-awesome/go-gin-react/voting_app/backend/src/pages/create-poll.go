package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Poll struct represents a poll
type Poll struct {
	Title     string `json:"title"`
	Description string `json:"description"`
	Options   []string `json:"options"`
}

// In-memory poll storage (replace with database in a real application)
var polls = []Poll{}

// Handler to create a new poll
func createPoll(c *gin.Context) {
	var newPoll Poll

	if err := c.ShouldBindJSON(&newPoll); err != nil {
		return err
	}

	// Basic validation - you should add more robust validation here
	if newPoll.Title == "" || newPoll.Description == "" || newPoll.Options == nil {
		return gin.Error("Invalid poll data")
	}

	// Add the new poll to the storage
	polls = append(polls, newPoll)

	// Return the created poll
	c.JSON(201, newPoll)
}

func main() {
	router := gin.New()

	// Serve static files
	router.Static("/static", "static")

	// Route for creating a poll
	router.POST("/polls", createPoll)

	// Start the server
	router.Run("localhost:8080")
}