package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

// ForumPost represents a forum post
type ForumPost struct {
	ID        string `json:"id"`
	Title     string `json:"title"`
	Content   string `json:"content"`
	CreatedAt string `json:"createdAt"`
}

// In-memory forum data (replace with database in real application)
var forumPosts []ForumPost

// ForumController handles forum-related logic
func ForumController(c *gin.Context) {
	switch c.Method {
	case "POST":
		// Handle creating a new forum post
		title := c.PostForm("title")
		content := c.PostForm("content")
		if title == "" || content == "" {
			c.JSON(400, gin.H{"error": "Title and content are required."})
			return
		}

		newPost := ForumPost{
			ID:        fmt.Sprintf("%d", len(forumPosts)+1), // Simple ID generation
			Title:     title,
			Content:   content,
			CreatedAt: fmt.Sprintf("%d", time.Now().Unix()), // Use Unix timestamp for creation time
		}
		forumPosts = append(forumPosts, newPost)
		c.JSON(201, newPost) // 201 Created status code
	case "GET":
		// Handle retrieving all forum posts
		c.JSON(200, forumPosts) // 200 OK status code
	}
}

func main() {
	// Initialize the Gin router
	router := gin.Default()

	// Define routes
	router.POST("/forum", ForumController)
	router.GET("/forum", ForumController)

	// Start the server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	fmt.Printf("Server listening on port %s\n", port)
	router.Run(":" + port)
}