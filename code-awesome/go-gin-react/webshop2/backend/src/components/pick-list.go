package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Order represents an order in the webshop
type Order struct {
	ID        int
	ProductID int
	Quantity int
	// Other order details...
}

// In-memory order storage (replace with database)
var orders []Order

// PickListController handles requests related to the pick list
func PickListController() {
	r := gin.New()
	r.LoadHTMLConfig("templates/pick-list.html") // Assuming you have a pick-list.html template
	r.GET("/pick-list", pickListHandler)

	log.Fatal(r.Run(":8080"))
}

// pickListHandler handles requests to display the pick list
func pickListHandler(c *gin.Context) {
	// Simulate fetching orders from a database (replace with actual database logic)
	// In a real application, this would fetch orders from a database.
	// For this example, we'll create some dummy orders.
	// This also demonstrates the content injection vulnerability - although not
	// intended here, it showcases how a malicious user could inject
	// arbitrary HTML into the template.
	dummyOrders := []Order{{ID: 1, ProductID: 101, Quantity: 2}, {ID: 2, ProductID: 102, Quantity: 1}}
	// This is a simplified vulnerability demonstration. A real application would
	// need robust sanitization and input validation.

	// Render the pick-list.html template
	c.HTML(200, gin.H{
		"orders": dummyOrders,
	})
}

func main() {
	PickListController()
}