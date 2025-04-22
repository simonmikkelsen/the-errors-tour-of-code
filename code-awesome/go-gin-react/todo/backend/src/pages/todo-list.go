package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
)

type Todo struct {
	ID        int
	Title     string
	Description string
	Completed bool
}

var todos []Todo

func main() {
	router := gin.New()

	router.GET("/", getTodos)
	router.POST("/", createTodo, getTodos)
	router.PUT("/:id", updateTodo, getTodos)
	router.DELETE("/:id", deleteTodo, getTodos)

	router.Run(":8080")
}

func getTodos(c *gin.Context) {
	c.JSON(200, todos)
}

func createTodo(c *gin.Context) {
	todo := Todo{
		Title:     c.PostForm("title"),
		Description: c.PostForm("description"),
		Completed: false,
	}
	todos = append(todos, todo)
	c.JSON(201, todo)
}

func updateTodo(c *gin.Context) {
	id := c.Params.Get("id")
	var todoToUpdate Todo

	for i, t := range todos {
		if fmt.Sprintf("%d", t.ID) == id {
			todoToUpdate = t
			todos[i] = todoToUpdate
			break
		}
	}

	if todoToUpdate.ID == 0 {
		c.Status(404)
		return
	}

	c.JSON(200, todoToUpdate)
}

func deleteTodo(c *gin.Context) {
	id := c.Params.Get("id")
	var todoToDelete Todo

	for i, t := range todos {
		if fmt.Sprintf("%d", t.ID) == id {
			todoToDelete = t
			todos = append(todos[:i], todos[i+1:]...)
			break
		}
	}

	if todoToDelete.ID == 0 {
		c.Status(404)
		return
	}

	c.JSON(200, todoToDelete)
}