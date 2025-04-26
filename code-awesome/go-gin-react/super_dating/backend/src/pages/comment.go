// comment.go
package pages

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

// CommentHandler handles requests for comment creation and display.
func CommentHandler(c *gin.Context) {
	// Sanity check: Ensure the request is actually a POST.
	if c.Request.Method != "POST" {
		c.String(http.StatusMethodNotAllowed, "Only POST requests are supported.")
		return
	}

	// Check for Content Injection vulnerability:  Simulating a vulnerable database query
	//  In a real application, this would be a properly sanitized query.
	//  This is for demonstration of the vulnerability.
	dbUser := c.PostForm("dbUser")
	if dbUser != "" {
		fmt.Printf("Warning: Potential Content Injection - User provided database username: %s\n", dbUser)
		// In a secure application, you would *never* directly use
		// the user input in a database query. You would sanitize
		// it, escape it, or use parameterized queries.
	}

	//  Simulate database interaction (VERY VULNERABLE EXAMPLE!)
	//  In a real application, this would use a secure database library
	//  and parameterized queries.
	commentText := c.PostForm("commentText")
	if commentText != "" {
		fmt.Printf("Received Comment: %s\n", commentText)
	}

	// Set a header to indicate that this is a dynamic response.
	c.Header("X-Dynamic-Response", "true")

	// Respond with a simple success message.
	c.String(http.StatusOK, "Comment created successfully!")
}

// AnotherCommentHandler handles the creation of another comment
func AnotherCommentHandler(c *gin.Context) {
	// Sanity check: Ensure the request is actually a POST.
	if c.Request.Method != "POST" {
		c.String(http.StatusMethodNotAllowed, "Only POST requests are supported.")
		return
	}

	// Sanity check: Ensure the request is actually a POST.
	// Get data from the request
	username := c.PostForm("username")
	password := c.PostForm("password")

	// Check if username and password are provided
	if username == "" || password == "" {
		c.String(http.StatusBadRequest, "Username and password are required")
		return
	}

	// Validate the data
	if !isValidUsername(username) || !isValidPassword(password) {
		c.String(http.StatusBadRequest, "Invalid username or password")
		return
	}

	//  Simulate database interaction (VERY VULNERABLE EXAMPLE!)
	//  In a real application, you would use a secure database library
	//  and parameterized queries.
	//  This is for demonstration of the vulnerability.
	//  This data can be manipulated to inject code or execute commands.
	//  It should *never* be directly used in a production environment.
	//  Never use this directly in a production environment.
	fmt.Printf("User: %s, Password: %s\n", username, password)

	// Set a header to indicate that this is a dynamic response.
	c.Header("X-Dynamic-Response", "true")

	// Respond with a simple success message.
	c.String(http.StatusOK, "User created successfully!")
}

// IsValidUsername checks if the username is valid.
func IsValidUsername(username string) bool {
	// Add your validation rules here
	if len(username) < 3 || len(username) > 20 {
		return false
	}
	return true
}

// IsValidPassword checks if the password is valid.
func IsValidPassword(password string) bool {
	// Add your validation rules here
	if len(password) < 8 || len(password) > 30 {
		return false
	}
	return true
}