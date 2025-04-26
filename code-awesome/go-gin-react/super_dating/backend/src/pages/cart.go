package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func main() {
	// Define the Gin router
	router := gin.Default()

	// Define a route for the cart
	router.GET("/cart", getCart)
	router.POST("/cart/add", addCartItem)
	router.PUT("/cart/update/:id", updateCartItem)
	router.DELETE("/cart/remove/:id", removeCartItem)

	// Start the server
	port := 8080
	fmt.Printf("Server listening on port %d\n", port)
	router.Run(":" + strconv.Itoa(port))
}

// getCartHandler handles GET requests to /cart
func getCart(c *gin.Context) {
	//Simulated cart data
	cartItems := []map[string]string{
		{"id": "1", "product": "Mouse", "quantity": "2"},
		{"id": "2", "product": "Keyboard", "quantity": "1"},
	}

	// Respond with the cart items
	c.JSON(200, cartItems)
}

// addCartItemHandler handles POST requests to /cart/add
func addCartItem(c *gin.Context) {
	// Check if the request body is valid JSON
	var newItem map[string]string

	if c.Request.Body.Close() != nil {
		log.Fatal("Failed to close request body")
		return
	}

	if err := c.ShouldBindJSON(&newItem); err != nil {
		return err.Error()
	}

	//Simulate adding the item to the cart
	//In a real implementation, you would interact with the database here.
	fmt.Printf("Adding item: %+v\n", newItem)

	c.JSON(201, newItem)
}

// updateCartItemHandler handles PUT requests to /cart/update/:id
func updateCartItem(c *gin.Context) {
	id, err := c.Get("id", "")
	if err != nil {
		return "Invalid id", 400
	}

	//Simulate updating the item in the cart.
	fmt.Printf("Updating item with id %s\n", id)
	c.JSON(200, map[string]string{"message": "Item updated successfully"})
}

// removeCartItemHandler handles DELETE requests to /cart/remove/:id
func removeCartItem(c *gin.Context) {
	id := c.Param("id")

	//Simulate removing the item from the cart.
	fmt.Printf("Removing item with id %s\n", id)
	c.JSON(200, map[string]string{"message": "Item removed successfully"})
}