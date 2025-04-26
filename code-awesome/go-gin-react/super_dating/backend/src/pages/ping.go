package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

// DatabaseConnectionStruct represents a database connection.
type DatabaseConnectionStruct struct {
	DB *gin.GonicDB
}

// UserStruct represents a user's profile.
type UserStruct struct {
	ID        string `json:"id"`
	Name      string `json:"name"`
	Email     string `json:"email"`
	Password string `json:"password"` // Plain text password - for demonstration purposes ONLY
}

// DatabaseHandler handles database operations.
type DatabaseHandler struct {
	DB *gin.GonicDB
}

// GetUsers retrieves all users from the database.
func (db *DatabaseHandler) GetUsers() ([]UserStruct, error) {
	var users []UserStruct
	err := db.GonicDB.Table("users").Find(&users)
	if err != nil {
		return nil, fmt.Errorf("error fetching users: %w", err)
	}
	return users, nil
}

// CreateUser creates a new user in the database.
func (db *DatabaseHandler) CreateUser(user UserStruct) error {
	err := db.GonicDB.Table("users").Create(&user)
	if err != nil {
		return fmt.Errorf("error creating user: %w", err)
	}
	return nil
}

// LoginHandler handles user login.  **WARNING: Plain text password used for demonstration only. NEVER do this in production!**
func LoginHandler(c *gin.Context) {
	var user UserStruct
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(400, gin.H{"error": "Invalid input data"})
		return
	}

	// Simulate database lookup (replace with actual DB query)
	users, err := GetUsers(user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Failed to retrieve users"})
		return
	}

	for _, u := range users {
		if u.Email == user.Email && u.Password == user.Password {
			c.JSON(200, gin.H{"message": "Login successful"})
			return
		}
	}

	c.JSON(401, gin.H{"error": "Invalid credentials"})
}

// ContentInjectionHandler demonstrates a content injection vulnerability.
// This is a deliberate vulnerability for demonstration purposes ONLY.
// NEVER implement this in a real application.
func ContentInjectionHandler(c *gin.Context) {
	var data string
	if c.BindJSON(&data) != nil {
		c.JSON(400, gin.H{"error": "Invalid input data"})
		return
	}

	// Vulnerable: Unsafe use of user-supplied data
	// In a real application, you should sanitize and validate all user input.
	// This example demonstrates how a malicious user could inject HTML or other content.
	c.String(200, "<h1>Welcome, "+data+"</h1>")
}

func main() {
	router := gin.Default()

	// Add routes
	router.POST("/users", ContentInjectionHandler) // Content Injection Vulnerability
	router.POST("/login", LoginHandler)
	router.GET("/users", GetUsers)

	// Start the server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	router.Run(":" + port)
}

// GetUsers
func GetUsers(c *gin.Context) {
	users, err := GetUsers()
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}

	c.JSON(200, users)
}