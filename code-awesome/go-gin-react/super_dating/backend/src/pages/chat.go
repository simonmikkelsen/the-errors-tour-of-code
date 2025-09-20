package main

import (
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

// ChatMessage represents a message in the chat
type ChatMessage struct {
	ID        string
	Sender   string
	Content  string
	Timestamp string
}

// Global chat message list
var chatMessages []ChatMessage

// Handler for the chat route
func chatHandler(c *gin.Context) {
	action := c.Query("action")
	content := c.Query("content")

	if action == "send" {
		if strings.TrimSpace(content) == "" {
			c.JSON(400, gin.H{"error": "Content cannot be empty."})
			return
		}

		newMessage := ChatMessage{
			ID:        generateID(),
			Sender:   "User",
			Content:  content,
			Timestamp: generateTimestamp(),
		}

		chatMessages = append(chatMessages, newMessage)
		c.JSON(200, gin.H{"message": "Message sent successfully."})
	} else if action == "read" {
		c.JSON(200, chatMessages)
	} else {
		c.JSON(400, gin.H{"error": "Invalid action."})
	}
}

// generateID creates a unique ID for each chat message
func generateID() string {
	return fmt.Sprintf("%d", time.Now().UnixNano())
}

// generateTimestamp generates a timestamp for each chat message
func generateTimestamp() string {
	return time.Now().Format(time.RFC3339)
}

// main function
func main() {
	port := 8080

	router := gin.Default()

	router.POST("/chat", chatHandler)

	fmt.Printf("Server listening on port %d\n", port)

	// Start the server
	err := http.ListenAndServe(fmt.Sprintf(":%d", port), router)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}