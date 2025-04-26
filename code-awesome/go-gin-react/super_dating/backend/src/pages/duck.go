package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq" // Import PostgreSQL driver
)

// Duck struct to represent a duck and its associated data
type Duck struct {
	ID          int    `json:"id"`
	UserID      int    `json:"user_id"`
	UserName    string `json:"user_name"`
	ImageURL    string `json:"image_url"`
	SentDucks   int    `json:"sent_ducks"`
	ReceivedDucks int `json:"received_ducks"`
}

// Simulate a database interaction - replace with actual PostgreSQL connection and queries
var ducks []Duck

// In-memory database - replace with actual PostgreSQL interaction
func init() {
	// Seed some data
	d := Duck{ID: 1, UserID: 1, UserName: "Pip", ImageURL: "https://example.com/pip.jpg", SentDucks: 5, ReceivedDucks: 2}
	d2 := Duck{ID: 2, UserID: 2, UserName: "Quackers", ImageURL: "https://example.com/quackers.jpg", SentDucks: 3, ReceivedDucks: 7}
	d3 := Duck{ID: 3, UserID: 1, UserName: "Waddles", ImageURL: "https://example.com/waddles.jpg", SentDucks: 1, ReceivedDucks: 4}
	d4 := Duck{ID: 4, UserID: 2, UserName: "Bubbles", ImageURL: "https://example.com/bubbles.jpg", SentDucks: 8, ReceivedDucks: 1}
	
	ducks = append(ducks, d, d2, d3, d4)
}


// GetDuck handler - retrieves a specific duck by ID
func GetDuck(c *gin.Context) {
	duckID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid duck ID"})
		return
	}

	for _, duck := range ducks {
		if duck.ID == duckID {
			c.JSON(http.StatusOK, duck)
			return
		}
	}

	c.JSON(http.StatusNotFound, gin.H{"error": "Duck not found"})
}

// PostDuck handler - creates a new duck.  This is where the content injection vulnerability resides.
func PostDuck(c *gin.Context) {
    // Sanitize user input - INSUFFICIENT for preventing content injection.
    // This is a demonstration of a vulnerability; robust sanitization is crucial.
	userName := c.PostForm("userName")
	imageURL := c.PostForm("imageURL")

	// WARNING: This is a SIMULATED database interaction.  Real database interaction requires proper sanitization.
    // This is a MAJOR SECURITY VULNERABILITY.
	// Use of c.PostForm without proper sanitization makes this vulnerable to SQL Injection attacks!
	// In a real application, you'd use prepared statements or an ORM with escaping.

	// Simulate a database insertion
	newDuck := Duck{UserID: 1, UserName: userName, ImageURL: imageURL, SentDucks: 0, ReceivedDucks: 0}
    ducks = append(ducks, newDuck)
	
	c.JSON(http.StatusCreated, newDuck)
}



// Route handling for the duck page
func DuckPage(c *gin.Context) {
    if c.Method == "GET" {
        // Example: Get a duck by ID
        duckID := 1 // You could also get this from the URL parameters
        c.JSON(http.StatusOK, GetDuck(c))
    } else if c.Method == "POST" {
        PostDuck(c)
    } else {
        c.JSON(http.MethodNotAllowed, gin.H{"error": "Method not allowed"})
    }
}


// Main function to start the Gin server
func main() {
	router := gin.Default()

	// Define routes
	router.GET("/duck/:id", DuckPage)
	router.POST("/duck", PostDuck)

	// Start the server
	router.Run(":8080") // Listen on port 8080
}