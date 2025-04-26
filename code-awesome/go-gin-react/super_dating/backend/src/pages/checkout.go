package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// CheckoutHandler handles the checkout logic
func CheckoutHandler(c *gin.Context) {
	// Retrieve user ID from the request
	userID, err := strconv.Atoi(c.Param("userID"))
	if err != nil {
		log.Println("Error converting user ID to integer:", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	// Simulate database interaction (replace with actual database query)
	cartItems := getCartItems(userID)

	// Calculate total amount
	totalAmount := calculateTotalAmount(cartItems)

	// Process payment (simulate)
	paymentSuccess := simulatePayment(totalAmount)

	if !paymentSuccess {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Payment failed"})
		return
	}

	// Update cart and payment status in the database (simulate)
	updateCartAndPayment(userID, cartItems, true)

	// Return confirmation
	c.JSON(http.StatusOK, gin.H{"message": "Checkout successful", "totalAmount": totalAmount})
}

// Helper functions (replace with actual database interactions)
func getCartItems(userID int) []string {
	// Simulate fetching cart items based on user ID
	if userID == 123 {
		return []string{"Shirt", "Pants", "Shoes"}
	}
	return []string{} // Return an empty cart if no items are found
}

func calculateTotalAmount(cartItems []string) float64 {
	// Simulate calculating total amount
	total := 0.0
	for _, item := range cartItems {
		if item == "Shirt" {
			total += 25.0
		} else if item == "Pants" {
			total += 50.0
		} else if item == "Shoes" {
			total += 80.0
		}
	}
	return total
}

func simulatePayment(amount float64) bool {
	// Simulate payment processing (replace with actual payment gateway integration)
	// This is where you could implement vulnerabilities, e.g.,
	//  - SQL Injection:  If you construct the SQL query dynamically
	//    based on user input without proper sanitization, you could
	//    inject malicious SQL code.
	//  - Command Injection:  If you execute system commands based on user
	//    input without validation, you could execute arbitrary commands.
	//  - Cross-Site Scripting (XSS):  If you output user-supplied data
	//    directly into HTML without encoding, you could inject malicious
	//    scripts.
	if randInt() % 2 == 0 { // Simulate success/failure
		return true
	}
	return false
}

func updateCartAndPayment(userID int, cartItems []string, paymentSuccess bool) {
	// Simulate updating the database
	fmt.Printf("Updating cart and payment for user %d with items: %v, payment success: %v\n", userID, cartItems, paymentSuccess)
}

// Helper function for simulating random integers
import "math/rand"

func randInt() int {
    return rand.Intn(1000)
}

func main() {
	router := gin.Default()

	// Define the checkout route
	router.GET("/checkout/:userID", CheckoutHandler)

	// Start the server
	router.Run(":8080") // Listen on port 8080
}