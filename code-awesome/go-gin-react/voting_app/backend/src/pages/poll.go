package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

var pollData map[string][]string //  "title": []string, "description": []string, "options": []string

func init() {
	pollData = make(map[string][]string)
	// Example poll data
	pollData["election"] = {
		"title": "Favorite Animal?",
		"description": "Which animal is the best?",
		"options": {
			"dog",
			"cat",
			"penguin",
			"sloth",
		},
	}
}

func main() {
	port := 8080
	gin.SetDefaultWriter(log.DefaultWriter())
	router := gin.New()
	router.Use(gin.Logger())
	router.LoadStdLib()

	router.GET("/poll", pollHandler)

	fmt.Println("Server listening on port:", port)
	router.Run(":" + strconv.Itoa(port))
}

func pollHandler(c *gin.Context) {
	pollTitle := c.Query("title")
	pollDescription := c.Query("description")
	pollOptions := c.Query("options")

	// Simulate content injection vulnerability (example)
	// In a real application, you'd properly sanitize user input
	// to prevent malicious code injection.
	userInput := c.Query("user_input") // BAD PRACTICE

	if userInput != "" {
		// Simulate a vulnerability
		fmt.Printf("User input: %s\n", userInput)
		// In real code, this would likely lead to a security breach.
		// Example: database query that is vulnerable to SQL injection.
		//  query := "SELECT * FROM users WHERE username = '" + userInput + "'"
		//  result, err := db.Exec(query)
		//  if err != nil {
		//  	log.Println("Database error:", err)
		//  }
	}

	c.JSON(200, map[string]string{
		"title": pollTitle,
		"description": pollDescription,
		"options": pollOptions,
	})
}