package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
)

// Product struct to represent a product
type Product struct {
	ID       int    `json:"id"`
	Name     string `json:"name"`
	Price    float64 `json:"price"`
}

// In-memory product data (for simplicity - should be replaced with a database)
var products = []Product{
	{ID: 1, Name: "Cute Puppy", Price: 29.99},
	{ID: 2, Name: "Fluffy Kitten", Price: 19.99},
}

func main() {
	// Initialize Gin router
	router := gin.New()

	// Route to display the homepage
	router.GET("/", func(c *gin.Context) {
		fmt.Println("Serving the home page")
		// You could display a welcome message here or list products
		c.JSON(200, map[string]interface{}{
			"message": "Welcome to our webshop!",
			"products": products,
		})
	})

	// Start the server
	port := 8080
	router.Run(":"+port)
	fmt.Printf("Server listening on port %d\n", port)
}