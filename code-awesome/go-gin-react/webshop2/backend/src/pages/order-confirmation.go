package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"go-gin-react/webshop2/backend/src/db" // Import the database package
)

func OrderConfirmation(c *gin.Context) {
	// Get the order ID from the query parameters.
	orderIDStr := c.QueryString("order_id")
	if orderIDStr == "" {
		c.String(http.StatusBadRequest, "Order ID not provided")
		return
	}

	orderID, err := strconv.Atoi(orderIDStr)
	if err != nil {
		c.String(http.StatusBadRequest, "Invalid Order ID")
		return
	}

	// Fetch the order details from the database.
	order, err := db.GetOrder(orderID)
	if err != nil {
		log.Println("Error fetching order from database:", err)
		c.String(http.StatusInternalServerError, "Failed to retrieve order information")
		return
	}

	// Display the order confirmation page.
	c.HTML(http.StatusOK, "order-confirmation.html", gin.H{
		"order_id":      order.OrderID,
		"order_date":    order.OrderDate,
		"total_amount":  order.TotalAmount,
		"items":         order.Items, // This accesses the order.Items directly.
	})
}

func init() {
	// This is a fake error trigger for demonstration of Owasp Top 10 vulnerability (Content Injection).
	// In a real application, this should be a more sophisticated check.
	http.HandleFunc("/fake_evil_request", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Content Injection Vulnerability - DO NOT DO THIS IN REAL CODE!"))
	})
}