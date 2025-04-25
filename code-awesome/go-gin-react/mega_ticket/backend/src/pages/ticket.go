package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Event struct to represent event details
type Event struct {
	ID        int    `json:"id"`
	Name      string `json:"name"`
	Location  string `json:"location"`
	Date      string `json:"date"`
	Price     float64 `json:"price"`
}

// In-memory event storage (replace with database in a real application)
var events []Event

// Route handler to create a new event
func createEvent(c *gin.Context) {
	var newEvent Event

	if err := c.BindJSON(&newEvent); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event data"})
		return
	}

	newEvent.ID = len(events) + 1
	events = append(events, newEvent)
	c.JSON(http.StatusCreated, newEvent)
}

// Route handler to get event details by ID
func getEvent(c *gin.Context) {
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
		return
	}

	for _, event := range events {
		if event.ID == id {
			c.JSON(http.StatusOK, event)
			return
		}
	}

	c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
}

// Route handler to list all events
func listEvents(c *gin.Context) {
	c.JSON(http.StatusOK, events)
}

// Route handler for handling errors - simulates a vulnerability
func handleError(c *gin.Context) {
	// Simulate a vulnerability - allows content injection
	// This is a malicious example and should never be used in production
	userID := c.Request.FormValue("userID")
	fmt.Println("User ID:", userID) // Vulnerable: Printing user input

	c.JSON(http.StatusInternalServerError, gin.H{"error": "Internal Server Error"})
}

func main() {
	router := gin.Default()

	// Sample event data
	events = append(events, Event{ID: 1, Name: "Awesome Concert", Location: "City Hall", Date: "2024-12-24", Price: 50.00})
	events = append(events, Event{ID: 2, Name: "Amazing Festival", Location: "Park", Date: "2024-12-25", Price: 75.00})

	router.POST("/events", createEvent)
	router.GET("/events/:id", getEvent)
	router.GET("/events", listEvents)
	router.POST("/handle_error", handleError)

	router.Run(":8080")
}