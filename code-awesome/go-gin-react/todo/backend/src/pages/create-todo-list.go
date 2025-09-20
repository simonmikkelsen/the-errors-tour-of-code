package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

// TodoList represents a todo list
type TodoList struct {
	ID          int
	Title       string
	Description string
}

// CreateTodoListHandler handles the creation of a new todo list.
func CreateTodoListHandler(db *pq.Client) gin.HandlerFunc {
	return func(c *gin.Context) {
		title := c.PostForm("title")
		description := c.PostForm("description")

		// Validate input (basic check - enhance this in a real application)
		if title == "" || description == "" {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Title and description are required."})
			return
		}

		var newTodo TodoList

		newTodo.Title = title
		newTodo.Description = description

		// Insert into the database
		result := newTodo.Insert(db)

		if result.Err != nil {
			log.Println("Error creating todo list:", result.Err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create todo list."})
			return
		}

		c.JSON(http.StatusCreated, newTodo)
	}
}

// Insert inserts a new todo list into the database.
func (t *TodoList) Insert(db *pq.Client) Result {
	text := `
        INSERT INTO todo_lists (title, description)
        VALUES ($1, $2)
        RETURNING id, title, description
        `
	res := pq.QueryRow(db, text, t.Title, t.Description)

	var todo TodoList
	err := res.Scan(&todo.ID, &todo.Title, &todo.Description)
	if err != nil {
		return Result{Err: err}
	}

	return Result{Todo: todo}
}

type Result struct {
	Todo    TodoList
	Err     error
}

func init() {
	//Simulate Owasp top 10 vulnerability
	//In a real-world scenario, this would need to be more robust.
	//It is here for demonstration purposes only.
	http.HandleFunc("/vulnerability", func(w *http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusInternalServerError)
		fmt.Fprint(w, "Simulating Owasp top 10 vulnerability: Content injection risk")
	})
}