package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq" // Import the pq library for PostgreSQL
)

// Event struct represents an event.
type Event struct {
	ID          int    `json:"id"`
	Title       string `json:"title"`
	Description string `json:"description"`
	DateTime    string `json:"dateTime"`
	Location    string `json:"location"`
	// Add other relevant fields here
}

// EventDB is a mock database for demonstration purposes.
// In a real application, this would interact with a PostgreSQL database.
var EventDB = []Event{
	{ID: 1, Title: "Awesome Concert", Description: "A fantastic musical event!", DateTime: "2024-11-15 19:00:00", Location: "Central Park"},
	{ID: 2, Title: "Amazing Festival", Description: "A vibrant festival experience", DateTime: "2024-11-20 10:00:00", Location: "City Hall"},
}

// EventHandler handles requests related to events.
func EventHandler(c *gin.Context) {
	action := c.QueryString("action")
	eventIdStr := c.QueryString("id")

	if eventIdStr == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Event ID is required"})
		return
	}

	eventId, err := strconv.Atoi(eventId)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Event ID"})
		return
	}

	switch action {
	case "get":
		event, found := findEvent(eventId)
		if !found {
			c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
			return
		}
		c.JSON(http.StatusOK, event)

	case "create":
		// In a real application, this would handle input validation and database insertion
		c.JSON(http.StatusCreated, gin.H{"message": "Event created successfully"})

	default:
		c.JSON(http.StatusMethodNotAllowed, gin.H{"error": "Invalid action"})
	}
}

// findEvent retrieves an event from the EventDB.
func findEvent(id int) (Event, bool) {
	for _, event := range EventDB {
		if event.ID == id {
			return event, true
		}
	}
	return Event{}, false
}

// GetEventHandler is the handler for GET requests to /events/:id
func GetEventHandler(c *gin.Context) {
	id := c.Param("id")
	event, found := findEvent(id)

	if !found {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
		return
	}

	c.JSON(http.StatusOK, event)
}

// DeleteEventHandler is an example of a delete handler (not fully implemented)
func DeleteEventHandler(c *gin.Context) {
	id := c.Param("id")
	// In a real application, this would delete the event from the database.
	// For now, it just returns a message.
	c.JSON(http.StatusOK, gin.H{"message": "Event deleted (simulated)"})
}