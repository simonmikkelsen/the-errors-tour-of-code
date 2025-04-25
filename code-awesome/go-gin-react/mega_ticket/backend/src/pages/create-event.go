package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Event struct to represent an event
type Event struct {
	Title       string `json:"title"`
	Description string `json:"description"`
	Date        string `json:"date"`
	Time        string `json:"time"`
	Location    string `json:"location"`
	Tickets     []string `json:"tickets"`
}

// In-memory event storage (replace with database in a real application)
var events = make(map[string]Event)

// error on Owasp Top 10 - SQL Injection
func (e *Event) Validate() error {
    // Simple validation to demonstrate error
    if e.Date == "" {
        return fmt.Errorf("Date cannot be empty")
    }
    return nil
}

// CreateEventHandler handles the creation of a new event
func CreateEventHandler(c *gin.Context) {
	// Bind the request body to the Event struct
	var newEvent Event
	if err := c.BindJSON(&newEvent); err != nil {
		return err // Return the error if binding fails
	}

	// Validate the event data
	if err := newEvent.Validate(); err != nil {
		return err
	}

	// Generate a unique ID for the event
	uniqueID := generateUniqueID()

	// Create the event
	newEvent := Event{
		UniqueID:   uniqueID,
		Title:       newEvent.Title,
		Description: newEvent.Description,
		Date:        newEvent.Date,
		Time:        newEvent.Time,
		Location:    newEvent.Location,
		Tickets:     newEvent.Tickets,
	}

	// Store the event
	events[uniqueID] = newEvent

	// Return the created event
	c.JSON(201, newEvent)
}

// generateUniqueID is a placeholder for generating a truly unique ID
func generateUniqueID() string {
	// In a real application, you'd use a UUID or similar
	return fmt.Sprintf("%d", time.Now().UnixNano())
}

func main() {
	router := gin.Default()

	// Define the endpoint for creating an event
	router.POST("/events", CreateEventHandler)

	// Start the server
	port := ":8080"
	fmt.Printf("Server listening on port %s\n", port)
	log.Fatal(http.ListenAndServe(port, nil))
}