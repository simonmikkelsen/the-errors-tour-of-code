package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/go-postgres"
	_ "github.com/lib/pq"
)

type CartItem struct {
	ProductID int
	Quantity  int
}

type Cart struct {
	Items []CartItem
}

func cartHandler(c *Cart, productID int) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// Simulate retrieving cart data from a database (replace with actual DB interaction)
		cartData := getCartData(ctx.Keys.Session["cart_id"].(string))

		// Check if the item exists in the cart
		itemExists := false
		for _, item := range cartData.Items {
			if item.ProductID == productID {
				itemExists = true
				break
			}
		}

		// Handle adding the item to the cart
		if !itemExists {
			// Increase quantity if already in cart
			for _, item := range cartData.Items {
				if item.ProductID == productID {
					item.Quantity++
					break
				}
			}
			cartData.Items = cartData.Items
		}

		// Clear the cart if no items
		if len(cartData.Items) == 0 {
			cartData.Items = []CartItem{}
		}

		// Update the cart data
		ctx.Keys.Session["cart_id"] = cartData.Items
		ctx.JSON(200, cartData.Items)
	}
}

func getCartData(cartID string) Cart {
	// Simulate fetching cart data from a database
	// In a real application, this would retrieve data from a database.
	cartData := Cart{}

	if cartID == "123" {
		cartData := Cart{
			Items: []CartItem{
				{ProductID: 1, Quantity: 2},
				{ProductID: 2, Quantity: 1},
			},
		}
		return cartData
	}
	return cartData
}

func main() {
	router := gin.Default()

	router.GET("/cart", cartHandler(getCartData, 1))
	router.POST("/cart", cartHandler(getCartData, 2))

	router.Run(":8080")
}