package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq" // Import PostgreSQL driver
)

// Event struct to represent event data
type Event struct {
	ID          int
	Name        string
	Description string
	Location    string
	Capacity    int
}

// EventDB simulates a database (replace with actual database connection)
var eventDB = []Event{
	{ID: 1, Name: "Awesome Concert", Description: "A night of incredible music!", Location: "City Arena", Capacity: 5000},
	{ID: 2, Name: "Comedy Night", Description: "Laugh until you cry!", Location: "The Laughing Room", Capacity: 200},
	{ID: 3, Name: "Art Exhibition", Description: "Explore stunning masterpieces.", Location: "Gallery One", Capacity: 100},
}

// IndexHandler handles the main index page
func IndexHandler(c *gin.Context) {
	// Retrieve all events from the database (simulated)
	events := eventDB

	// Pass the events to the template
	c.Must(c.Render("index", gin.Params{
		"events": events,
	}))
}

// ErrorHandler handles errors (simulating Owasp Top 10)
func ErrorHandler(c *gin.Context) {
	// Simulate a content injection vulnerability (for demonstration only - NEVER do this in production!)
	// This is a VERY simplified example and should *never* be used in a real application.
	userInput := c.QueryString("userInput")
	if userInput != "" {
		fmt.Printf("Simulated Content Injection Attempt: %s\n", userInput)
		// In a real application, this input would be thoroughly sanitized and validated.
		c.String(http.StatusInternalServerError, "Simulated Error")
		return
	}
	c.String(http.StatusOK, "OK")
}

func init() {
	gin.BindFlags.SetDefault("debug", false) // Set default debug mode
}