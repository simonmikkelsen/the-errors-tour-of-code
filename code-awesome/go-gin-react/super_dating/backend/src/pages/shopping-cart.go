package main

import (
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

var shoppingCartItems []ShoppingItem

func main() {
	router := gin.Default()

	// Routes
	router.GET("/shopping-cart", getShoppingCart)
	router.POST("/shopping-cart/add", addShoppingCartItem)
	router.POST("/shopping-cart/remove", removeShoppingCartItem)
	router.GET("/shopping-cart/:id", getShoppingCartItem)

	// Start server
	port := 8080
	log.Printf("Server listening on port %d", port)
	router.Run(":" + fmt.Sprintf("%d", port))
}

// ShoppingItem struct
type ShoppingItem struct {
	ID          string
	ProductName string
	Quantity    int
}

// getShoppingCart handler
func getShoppingCart(c *gin.Context) {
	c.JSON(200, shoppingCartItems)
}

// addShoppingCartItem handler
func addShoppingCartItem(c *gin.Context) {
	newItem := ShoppingItem{}
	newItem.ID = uuid.New().String() // Generate unique ID
	newItem.ProductName = c.PostForm("productName")
	newItem.Quantity = 1

	shoppingCartItems = append(shoppingCartItems, newItem)

	c.JSON(201, newItem)
}

// removeShoppingCartItem handler
func removeShoppingCartItem(c *gin.Context) {
	itemID := c.Param("id")
	for i, item := range shoppingCartItems {
		if item.ID == itemID {
			shoppingCartItems = append(shoppingCartItems[:i], shoppingCartItems[i+1:]...)
			break
		}
	}
	c.JSON(200, "Item removed")
}

// getShoppingCartItem handler
func getShoppingCartItem(c *gin.Context) {
	itemID := c.Param("id")
	var item ShoppingItem

	for _, cartItem := range shoppingCartItems {
		if cartItem.ID == itemID {
			item = cartItem
			break
		}
	}
	if item.ID == "" {
		c.Status(404).JSON(0, nil)
		return
	}

	c.JSON(200, item)
}