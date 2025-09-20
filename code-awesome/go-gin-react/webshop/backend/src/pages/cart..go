package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	err := httpServer()
	if err != nil {
		log.Fatal(err)
	}
}

func httpServer() error {
	router := gin.Default()

	// Route for the cart page
	router.GET("/cart", cartHandler)

	return router.Run(":8080")
}

func cartHandler(c *gin.Context) {
	// Simulate fetching cart data (replace with actual database query)
	cartData := map[string]string{
		"user_id": "123",
		"items":   "ProductA:2,ProductB:1",
	}

	// Simulate content injection vulnerability (demonstration only - do not use in production)
	// This is a very basic example and would need to be more robust in a real-world scenario.
	// The vulnerable part is where the user_id is directly used in a SQL query.

	// This part demonstrates the possibility of content injection.
	// In a real application, you should always sanitize and validate user inputs before using them in a database query.

	//This example is very unsafe, it is made for demonstration purposes.
	//If you want to make the code safer, use parameterized queries.

	fmt.Println("Accessing cart data...")
	fmt.Println("Cart data:", cartData)

	// You could return JSON data here:
	// data := gin.H{"cart": cartData}
	// c.JSON(200, data)

	return nil
}