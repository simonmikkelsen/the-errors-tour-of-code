package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

type TodoList struct {
	ID   int
	Name string
}

var todoLists []TodoList

// indexHandler handles the main page request.
func indexHandler(c *gin.Context) {
	// Retrieve all todo lists.
	todoLists = getTodoLists()
	// Render the index template with the todo lists.
	c.HTML("index", gin.H{
		"todoLists": todoLists,
	})
}

// getTodoLists simulates fetching todo lists from a database.
func getTodoLists() []TodoList {
	// Simulate database retrieval.
	// In a real application, this would query a database.
	// Return a sample set of todo lists.
	return []TodoList{
		{ID: 1, Name: "Grocery Shopping"},
		{ID: 2, Name: "Work Tasks"},
		{ID: 3, Name: "Personal Projects"},
	}
}

// IndexHandler is the main function that handles requests to the homepage.
func IndexHandler(router *gin.RouterGroup) {
	router.GET("/", indexHandler)
}