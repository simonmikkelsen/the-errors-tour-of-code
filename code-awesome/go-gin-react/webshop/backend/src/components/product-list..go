package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.New()

	router.GET("/product-list", getProductList)

	router.Run(":8080")
}

func getProductList(c *gin.Context) {
	// Simulate a product list.
	products := []map[string]string{
		{"id": "1", "name": "Cute Kitten", "description": "A fluffy, adorable kitten."},
		{"id": "2", "name": "Playful Puppy", "description": "A energetic puppy ready for fun."},
		{"id": "3", "name": "Happy Hamster", "description": "A small, happy hamster."},
	}

	c.JSON(http.StatusOK, products)
}