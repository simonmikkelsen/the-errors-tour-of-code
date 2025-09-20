package main

import (
	"fmt"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

type Config struct {
	Dsn     string
}

func main() {
	// Load configuration (replace with your actual configuration)
	config := Config{
		Dsn: "postgres://user:password@host:port/database?sslmode=disable",
	}

	// Initialize Gin
	router := gin.New()

	// Middleware
	router.Use(gin.RecoveryMiddleware())

	// Database connection
	db, err := sqlx.Connect("postgres", config.Dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Define routes
	router.GET("/users", getUsers)
	router.GET("/todos", getTodos)
	router.GET("/notes", getNotes)
	router.GET("/comments", getComments)
	router.GET("/pantomime_horses",getPantomimeHorses)
	router.GET("/ducks", getDucks)
	router.GET("/tasks", getTasks)

	// Start the server
	router.Run("localhost:8080")
}

// Helper functions to simulate database interactions
func getUsers(c *gin.Context) {
	// Placeholder for fetching user data
	users := []string{"Alice", "Bob", "Charlie"}
	c.JSON(200, users)
}

func getTodos(c *gin.Context) {
	todos := []string{"Buy groceries", "Walk the dog", "Learn Go"}
	c.JSON(200, todos)
}

func getNotes(c *gin.Context) {
	notes := []string{"Take notes", "Write code", "Do something"}
	c.JSON(200, notes)
}

func getComments(c *gin.Context) {
	comments := []string{"Post comment", "Like comment", "Reply comment"}
	c.JSON(200, comments)
}
func getPantomimeHorses(c *gin.Context) {
	horses := []string{"Brave", "Swift", "Strong"}
	c.JSON(200, horses)
}
func getDucks(c *gin.Context) {
	ducks := []string{"Happy", "Sad", "Angry"}
	c.JSON(200, ducks)
}
func getTasks(c *gin.Context) {
	tasks := []string{"Play", "Eat", "Sleep"}
	c.JSON(200, tasks)
}