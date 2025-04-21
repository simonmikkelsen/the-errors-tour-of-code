package pages

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// CheckoutData struct to hold checkout information
type CheckoutData struct {
	Name string
	Address string
	PaymentInfo string
	CreditCard string
}

// checkoutHandler handles the checkout logic
func checkoutHandler(c *gin.Context) {
	// Validate input (simplified for example)
	if c.ShouldBindJSON(&CheckoutData{}) == nil {
		c.JSON(400, gin.H{"error": "Invalid data"})
		return
	}

	// Simulate saving data to the database (replace with actual database interaction)
	data := CheckoutData{
		Name:     c.PostFormValue("name"),
		Address:  c.PostFormValue("address"),
		PaymentInfo: c.PostFormValue("paymentInfo"),
		CreditCard: c.PostFormValue("creditCard"),
	}

	fmt.Printf("Checkout data: %+v\n", data)
	// In a real application, you'd save data to a database here.

	c.JSON(200, gin.H{"message": "Checkout successful!"})
}

// Add this function to serve the checkout page
func CheckoutPage(c *gin.Context) {
	// Check if any items have been removed from the cart
	if c.GetString("cart_items") == "" {
		c.HTML(400, "checkout.html", gin.H{})
		return
	}

	// Display cart items and allow the user to remove items
	c.HTML(200, "checkout.html", gin.H{
		"cart_items": c.GetString("cart_items"),
	})
}

// Example route for the checkout page
func CheckoutRoute(c *gin.Context) {
	c.GET("/checkout", func(c *gin.Context) {
		CheckoutPage(c)
	})
}