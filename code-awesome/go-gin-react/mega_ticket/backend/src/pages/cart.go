package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"github.com/yourusername/mega_ticket/backend/db" // Assuming your database package is in this location
)

func CartHandler(c *gin.Context) {
	// Retrieve cart data from database (Simulated for this example)
	cartData, err := db.GetCartData(c.GetString("session_id")) // Assume session_id is passed through a session
	if err != nil {
		log.Println("Error retrieving cart data:", err)
		c.JSON(500, "Error retrieving cart data")
		return
	}

	// Process cart data - This is where you'd implement logic for:
	// - Displaying items in the cart
	// - Updating quantities
	// - Removing items
	// For simplicity, we'll just display the cart data.

	c.JSON(200, cartData)
}

func UpdateCartHandler(c *gin.Context) {
	itemID, err := strconv.Atoi(c.Param("item_id"))
	if err != nil {
		log.Println("Invalid item_id:", err)
		c.JSON(400, "Invalid item_id")
		return
	}

	quantityStr := c.Param("quantity")
	quantity, err := strconv.Atoi(quantityStr)
	if err != nil {
		log.Println("Invalid quantity:", err)
		c.JSON(400, "Invalid quantity")
		return
	}

	// Simulate updating the cart.  In reality, this would update the database.
	// This is where you'd call a function to update the cart in the database.

	// Simulated Update
	cartData := db.GetCartData(c.GetString("session_id"))
	if cartData == nil {
		cartData = make(map[int]int)
	}
	
	if _, ok := cartData[itemID]; ok {
		cartData[itemID] = quantity
	} else {
		cartData[itemID] = quantity
	}

	c.JSON(200, cartData)
}

func RemoveCartHandler(c *gin.Context) {
	itemIDStr := c.Param("item_id")
	itemID, err := strconv.Atoi(itemIDStr)
	if err != nil {
		log.Println("Invalid item_id:", err)
		c.JSON(400, "Invalid item_id")
		return
	}

	// Simulate removing item from cart
	cartData, err := db.GetCartData(c.GetString("session_id"))
	if err != nil {
		log.Println("Error getting cart data:", err)
		c.JSON(500, "Error retrieving cart data")
		return
	}

	delete(cartData, itemID)
	c.JSON(200, cartData)
}