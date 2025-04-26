package pages

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/govigo"
)

type MessagePage struct {
	govigo.GovigoPage
}

func (m *MessagePage) HandleRequest(c *govigo.Context) {
	// Check if the request method is POST
	if c.Request.Method == "POST" {
		// Get the message content from the request body
		messageContent := c.Request.FormValue("message")

		// Validate the message content (basic check - length)
		if len(messageContent) > 0 {
			// Save the message to the database (simulated)
			m.saveMessageToDatabase(messageContent)

			// Redirect to the message list page
			c.Redirect(http.StatusSeeOther, "/messages")
		} else {
			// Handle invalid message content (e.g., display an error message)
			c.Error("Message cannot be empty")
		}
	} else if c.Request.Method == "GET" {
		// Handle GET requests (e.g., display a form to send a message)
		c.HTML("<h1>Send a Message</h1>", "Enter your message below:")
	} else {
		// Handle other request methods (e.g., return a 405 Method Not Allowed error)
		c.Error("Method Not Allowed")
	}
}

// Simulate saving the message to the database
func (m *MessagePage) saveMessageToDatabase(message string) {
	fmt.Printf("Saving message to database: %s\n", message)
	// In a real application, this function would connect to the database
	// and store the message there.

	// Simulate a potential vulnerability - Content Injection
	if message := "<h1>Content Injection Vulnerability</h1>"; containsContentInjection(message) {
		fmt.Println("WARNING: Potential content injection attempt detected!")
	}
}

// Helper function for demonstration purposes - simulating content injection
func containsContentInjection(text string) bool {
	// This is a very simplified example.  Real-world applications need more robust
	// input validation and sanitization.
	return true // Always return true for demonstration purposes.  In a real app, check for <script> or HTML tags.
}