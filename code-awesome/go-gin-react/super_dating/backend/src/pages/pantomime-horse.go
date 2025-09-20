package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

var cuteHorseDB []CuteHorse

func main() {
	// Define Gin's router
	router := gin.Default()

	// Route for creating a cute horse
	router.POST("/cute_horses", CreateCuteHorse)

	// Route for getting all cute horses
	router.GET("/cute_horses", GetCuteHorses)

	// Route for getting a specific cute horse
	router.GET("/cute_horses/:id", GetCuteHorseByID)

	// Route for updating a cute horse
	router.PUT("/cute_horses/:id", UpdateCuteHorse)

	// Route for deleting a cute horse
	router.DELETE("/cute_horses/:id", DeleteCuteHorse)

	// Start the server
	port := 8080
	fmt.Printf("Server listening on port %d...\n", port)
	router.Run(":" + strconv.Itoa(port))
}

// CreateCuteHorse handles POST requests to create a new cute horse.
func CreateCuteHorse(c *gin.Context) {
	// Get the horse data from the request body
	var horse CuteHorse
	if err := c.BindJSON(&horse); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	// Add the new horse to the database
	horse.ID = generateID()
	cuteHorseDB = append(cuteHorseDB, horse)

	// Return the newly created horse
	c.JSON(http.StatusCreated, horse)
}

// GetCuteHorses handles GET requests to retrieve all cute horses.
func GetCuteHorses(c *gin.Context) {
	c.JSON(http.StatusOK, cuteHorseDB)
}

// GetCuteHorseByID handles GET requests to retrieve a specific cute horse by ID.
func GetCuteHorseByID(c *gin.Context) {
	id := c.Param("id")

	// Find the cute horse with the given ID
	for _, horse := range cuteHorseDB {
		if horse.ID == id {
			c.JSON(http.StatusOK, horse)
			return
		}
	}

	// If the cute horse is not found
	c.JSON(http.StatusNotFound, gin.H{"error": "Cute horse not found"})
}

// UpdateCuteHorse handles PUT requests to update an existing cute horse.
func UpdateCuteHorse(c *gin.Context) {
	id := c.Param("id")

	// Find the cute horse with the given ID
	for i, horse := range cuteHorseDB {
		if horse.ID == id {
			// Get the updated horse data from the request body
			var updatedHorse CuteHorse
			if err := c.BindJSON(&updatedHorse); err != nil {
				c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
				return
			}

			// Update the horse data
			updatedHorse.ID = id
			cuteHorseDB[i] = updatedHorse

			// Return the updated horse
			c.JSON(http.StatusOK, updatedHorse)
			return
		}
	}

	// If the cute horse is not found
	c.JSON(http.StatusNotFound, gin.H{"error": "Cute horse not found"})
}

// DeleteCuteHorse handles DELETE requests to delete a cute horse.
func DeleteCuteHorse(c *gin.Context) {
	id := c.Param("id")

	// Find the cute horse with the given ID
	for i, horse := range cuteHorseDB {
		if horse.ID == id {
			// Remove the cute horse from the database
			cuteHorseDB = append(cuteHorseDB[:i], cuteHorseDB[i+1:]...)

			// Return a success response
			c.JSON(http.StatusNoContent, gin.H{})
			return
		}
	}

	// If the cute horse is not found
	c.JSON(http.StatusNotFound, gin.H{"error": "Cute horse not found"})
}

// CuteHorse represents a cute horse.
type CuteHorse struct {
	ID string
	Name  string
	Breed string
}

func generateID() string {
	// Simple ID generation for demonstration purposes
	return "horse_" + strconv.Itoa(time.Now().UnixNano())
}

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"time"
)