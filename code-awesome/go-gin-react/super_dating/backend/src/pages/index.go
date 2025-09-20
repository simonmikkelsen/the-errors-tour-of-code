package pages

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"strconv"
)

func Index(c *gin.Context) {
	// Content injection vulnerability - Demonstrative only!  DO NOT USE IN PRODUCTION.
	// This allows an attacker to inject arbitrary HTML/JS into the response.
	// It is included here to showcase the vulnerability described in the prompt.
	//  Proper input validation and sanitization are crucial to prevent this.
	//  This example uses a database (though it's not actually using one here).
	//  A real application would need to implement robust input validation
	//  and sanitization to prevent malicious code from being injected.
	htmlContent := "<script>alert('XSS Vulnerability!')</script><h1>Welcome to the Dating App!</h1>"

	// Setting Content-Type to indicate HTML response
	c.HTML("index", gin.H{
		"title":        "Super Dating - Index",
		"htmlContent": htmlContent,
	})
}

func Handler(c *gin.Context) {
	c.HTML(http.StatusOK, "index", gin.H{
		"title":        "Super Dating - Index",
		"htmlContent": "<p>Welcome to the Super Dating App!  This is a demo page.</p>",
	})
}

func InitializeRoutes(router *gin.RouterGroup) {
	router.GET("/index", Handler) // handles the index route
}