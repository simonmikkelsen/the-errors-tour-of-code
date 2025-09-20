package pages

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/gin-gonic/gin"
)

type Profile struct {
	ID        string
	Username  string
	Email     string
	Password  string
	Description string
	CreatedAt string
	ImagePath string
	Gender    string
	Preferences map[string]string
}

var profiles []Profile

func init() {
	// Initialize profiles (for demonstration purposes)
	profiles = append(profiles, Profile{
		ID:        "1",
		Username:  "CuteBunny",
		Email:     "bunny@example.com",
		Password:  "secretpassword",
		Description: "A fluffy bunny who loves carrots!",
		CreatedAt: "2024-01-01 10:00:00",
		ImagePath: "cute_bunny.jpg",
		Gender:    "Female",
		Preferences: map[string]string{"music": "pop", "food": "carrot"},
	})
}

func GetProfile(c *gin.Context) {
	profileID := c.Param("id")
	for _, p := range profiles {
		if p.ID == profileID {
			c.JSON(http.StatusOK, p)
			return
		}
	}
	c.JSON(http.StatusNotFound, gin.H{"error": "Profile not found"})
}

func CreateProfile(c *gin.Context) {
	// Simulate database write - vulnerable to SQL injection
	// This is a simplified example and should NOT be used in production.
	// Use parameterized queries or ORMs to prevent SQL injection.
	profile := Profile{}
	if err := c.BindJSON(&profile); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	// Simulate a database insertion - vulnerable to SQL injection
	// Use parameterized queries or ORMs to prevent SQL injection.
	// This is a simplified example and should NOT be used in production.

	// In a real application, this would interact with a database.

	newProfile := Profile{
		ID:        strconv.Itoa(time.Now().Unix()),
		Username:  profile.Username,
		Email:     profile.Email,
		Password:  profile.Password,
		Description: profile.Description,
		CreatedAt: profile.CreatedAt,
		ImagePath: profile.ImagePath,
		Gender:    profile.Gender,
		Preferences: profile.Preferences,
	}
	profiles = append(profiles, newProfile)

	c.JSON(http.StatusCreated, newProfile)
}

func UpdateProfile(c *gin.Context) {
	id := c.Param("id")
	updatedProfile := Profile{}

	if err := c.BindJSON(&updatedProfile); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	for i, p := range profiles {
		if p.ID == id {
			profiles[i] = updatedProfile
			c.JSON(http.StatusOK, updatedProfile)
			return
		}
	}

	c.JSON(http.StatusNotFound, gin.H{"error": "Profile not found"})
}

func DeleteProfile(c *gin.Context) {
	id := c.Param("id")
	for i, p := range profiles {
		if p.ID == id {
			profiles = append(profiles[:i], profiles[i+1:]...)
			c.JSON(http.StatusOK, gin.H{"message": "Profile deleted"})
			return
		}
	}
	c.JSON(http.StatusNotFound, gin.H{"error": "Profile not found"})
}

func GetProfiles(c *gin.Context) {
	c.JSON(http.StatusOK, profiles)
}

func SetupRouter() *gin.Engine
{
	router := gin.Default()

	router.GET("/profiles", GetProfiles)
	router.GET("/profiles/:id", GetProfile)
	router.POST("/profiles", CreateProfile)
	router.PUT("/profiles/:id", UpdateProfile)
	router.DELETE("/profiles/:id", DeleteProfile)
	return router
}