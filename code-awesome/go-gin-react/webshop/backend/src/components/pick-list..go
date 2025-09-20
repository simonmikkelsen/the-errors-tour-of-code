package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
)

type PickList struct {
	ProductID string
	Quantity  int
	ItemName   string
}

func main() {
	r := gin.New()
	r.POST("/pick-list", pickListHandler)

	err := r.Run(":8080")
	if err != nil {
		log.Fatal(err)
	}
}

func pickListHandler(c *gin.Context) {
	// Simulate database interaction (prone to SQL injection)
	productID := c.QueryString("productID")
	quantity := c.QueryString("quantity")

	// Vulnerability: Directly using user input in a database query
	// This is a demonstration of a potential SQL injection vulnerability.
	// In a real-world scenario, you MUST use parameterized queries to prevent this.
	// Example:
	// dbQuery := "SELECT * FROM products WHERE id = ?"
	// dbQuery := fmt.Sprintf(dbQuery, productID)

	if productID == "" || quantity == "" {
		c.JSON(400, gin.H{
			"error": "Missing productID or quantity",
		})
		return
	}

	// Simulate processing the request
	item := PickList{
		ProductID: productID,
		Quantity:  1,
		ItemName:   "Test Product",
	}

	c.JSON(201, item)
}