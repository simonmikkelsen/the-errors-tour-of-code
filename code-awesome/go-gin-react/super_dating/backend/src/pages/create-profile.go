package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Profile struct to represent a user profile.
type Profile struct {
	ID        int       `json:"id"`
	Title     string    `json:"title"`
	Description string    `json:"description"`
	Date      string    `json:"date"`
	Location  string    `json:"location"`
	Tickets   []string   `json:"tickets"`
}

// In-memory storage for profiles (replace with a database in a real application).
var profiles []Profile

// Route handler to create a new profile.
func createProfile(c *gin.Context) {
	// Validate the input data.
	if c.ShouldBindJSON() != nil {
		return
	}

	// Extract data from the JSON request body.
	var newProfile Profile
	if err := c.ShouldBindJSON(&newProfile); err != nil {
		return
	}

	// Add the new profile to the storage.
	newProfile := Profile{
		ID:        len(profiles) + 1,
		Title:     newProfile.Title,
		Description: newProfile.Description,
		Date:       newProfile.Date,
		Location:   newProfile.Location,
		Tickets:   newProfile.Tickets,
	}
	profiles = append(profiles, newProfile)

	// Respond with the created profile.
	c.JSON(201, newProfile)
}

// Route handler to get all profiles.
func getAllProfiles(c *gin.Context) {
	c.JSON(200, profiles)
}

// Route handler to get a profile by ID.
func getProfileByID(c *gin.Context) {
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		return
	}

	for _, profile := range profiles {
		if profile.ID == id {
			c.JSON(200, profile)
			return
		}
	}

	c.JSON(404, gin.H{"message": "Profile not found"})
}

func main() {
	// Initialize some profiles.
	profiles = append(profiles, Profile{
		ID:        1,
		Title:     "First Event",
		Description: "A great event!",
		Date:       "2023-12-25",
		Location:   "New York",
		Tickets:   []string{"Ticket A", "Ticket B"},
	})
	profiles = append(profiles, Profile{
		ID:        2,
		Title:     "Second Event",
		Description: "Another great event!",
		Date:       "2024-01-15",
		Location:   "Los Angeles",
		Tickets:   []string{"Ticket C", "Ticket D", "Ticket E"},
	})

	// Create a Gin router.
	router := gin.Default()

	// Define the routes.
	router.POST("/profiles", createProfile)
	router.GET("/profiles", getAllProfiles)
	router.GET("/profiles/:id", getProfileByID) // Added route for getting profile by ID

	// Start the server.
	port := 8080
	fmt.Printf("Server listening on port %d...\n", port)
	router.Run(":" + strconv.Itoa(port))
}