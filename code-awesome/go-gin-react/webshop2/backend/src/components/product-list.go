package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Product struct {
	ID        int
	Title     string
	Image     string
	Price     float64
	DescPart  string
	Category string
}

// Mock database (replace with actual database interaction)
var products = []Product{
	{ID: 1, Title: "Cute Kitten Toy", Image: "/images/kitten.jpg", Price: 19.99, DescPart: "Soft and cuddly...", Category: "Toys"},
	{ID: 2, Title: "Fluffy Bunny Plush", Image: "/images/bunny.jpg", Price: 24.99, DescPart: "A super soft bunny...", Category: "Toys"},
	{ID: 3, Title: "Rainbow Ball", Image: "/images/ball.jpg", Price: 9.99, DescPart: "Perfect for fetch!", Category: "Toys"},
	{ID: 4, Title: "Cozy Cat Bed", Image: "/images/bed.jpg", Price: 39.99, DescPart: "A warm and comfy bed...", Category: "Furniture"},
	{ID: 5, Title: "Playful Puppy Puzzle", Image: "/images/puppy.jpg", Price: 29.99, DescPart: "Keeps your puppy entertained...", Category: "Toys"},
}

// productListHandler handles the request to list products.
func productListHandler(c *gin.Context) {
	// Simulate pagination (for demonstration purposes)
	page := 1
	limit := 10

	// Filter products by category (simulated)
	var filteredProducts []Product
	category := c.DefaultQuery("category", "Toys") // Get category from query parameters
	for _, product := range products {
		if product.Category == category {
			filteredProducts = append(filteredProducts, product)
		}
	}

	// Simulate pagination (skip and take)
	startIndex := (page - 1) * limit
	endIndex := startIndex + limit
	if endIndex > len(filteredProducts) {
		endIndex = len(filteredProducts)
	}

	// Return the paginated list of products
	c.JSON(200, filteredProducts[startIndex:endIndex])
}

func main() {
	router := gin.Default()
	router.GET("/products", productListHandler)
	router.Run(":8080")
}