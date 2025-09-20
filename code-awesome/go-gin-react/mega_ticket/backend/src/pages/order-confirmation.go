package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
)

var (
	// Define a map for storing order information (replace with database connection later)
	orders = map[string]map[string]string{
		"123": {
			"user_id": "user123",
			"ticket_type": "Concert Ticket",
			"event_name": "Awesome Rocks Festival",
			"quantity": "2",
		},
	}

	// Simulate a database connection (replace with actual database interaction)
	dbConnection = "Fake PostgreSQL Connection"
)

func main() {
	router := gin.Default()

	// Define a route to confirm the order
	router.GET("/order-confirmation", orderConfirmationHandler)

	// Start the server
	router.Run(":8080")
}

func orderConfirmationHandler(c *gin.Context) {
	// Get the order ID from the query parameters
	orderID := c.QueryString("order_id")

	if orderID == "" {
		c.String(400, "Order ID is missing")
		return
	}

	// Retrieve order information from the map (simulating database retrieval)
	orderInfo, ok := orders[orderID]
	if !ok {
		c.String(404, "Order not found")
		return
	}

	// Format the order confirmation message
	confirmationMessage := fmt.Sprintf("Order Confirmation:\n" +
		"Order ID: %s\n" +
		"Event: %s\n" +
		"Ticket Type: %s\n" +
		"Quantity: %s\n",
		orderID,
		orderInfo["event_name"],
		orderInfo["ticket_type"],
		orderInfo["quantity"])

	// Log the order confirmation (for debugging/monitoring - be careful with sensitive data!)
	log.Println(fmt.Sprintf("Order %s confirmed for user %s", orderID, orderInfo["user_id"]))

	// Send the confirmation message back to the client
	c.String(200, confirmationMessage)
}