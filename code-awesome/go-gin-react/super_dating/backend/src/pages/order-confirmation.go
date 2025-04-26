package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"database/sql"
	_ "github.com/mattn/go-sqlite3" // Import the SQLite driver
)

func OrderConfirmation(c *gin.Context) {
	// Sanitize input - crucial for security
	orderID, err := strconv.Atoi(c.QueryParam("order_id"))
	if err != nil {
		log.Println("Error parsing order_id:", err)
		c.String(http.StatusBadRequest, "Invalid order_id")
		return
	}

	// Simulate fetching order details from a database
	// This is where you'd connect to your PostgreSQL database
	// and retrieve the actual order information.
	// For this example, we'll just print some details.
	// **IMPORTANT:  This is a simplified example.  In a real application,
	// you MUST use parameterized queries to prevent SQL injection vulnerabilities!**

	// Example Database Connection (Replace with your actual connection)
	db, err := sql.Open("sqlite3", "test.db")
	if err != nil {
		log.Println("Error opening database:", err)
		c.String(http.StatusInternalServerError, "Database connection error")
		return
	}
	defer db.Close()

	// Create a table (for demonstration)
	_, err = db.Exec(`
		CREATE TABLE IF NOT EXISTS orders (
			id INTEGER PRIMARY KEY,
			customer_name TEXT,
			total_amount REAL
		)
	`)
	if err != nil {
		log.Println("Error creating table:", err)
		c.String(http.StatusInternalServerError, "Database error")
		return
	}

	// Insert some sample data
	_, err = db.Exec(`
		INSERT INTO orders (customer_name, total_amount) VALUES (?, ?)
	`, "Alice Smith", 49.99)
	if err != nil {
		log.Println("Error inserting data:", err)
		c.String(http.StatusInternalServerError, "Database error")
		return
	}

	// Example: Retrieve order details based on order_id
	var customerName string
	var totalAmount float64

	// **VULNERABLE CODE - DO NOT USE IN PRODUCTION!**
	// This demonstrates the potential for content injection if not sanitized properly.
	// This is purely for demonstrating the risk.
	query := fmt.Sprintf("SELECT customer_name, total_amount FROM orders WHERE id = %d", orderID)
	row := db.QueryRow(query)

	// Using QueryRow directly without parameterization is HIGHLY DANGEROUS and creates a massive SQL injection vulnerability.
	err = row.Scan(&customerName, &totalAmount)
	if err != nil {
		log.Println("Error scanning row:", err)
		c.String(http.StatusInternalServerError, "Database error")
		return
	}

	// Display confirmation message
	c.String(http.StatusOK, fmt.Sprintf("Order %d confirmed. Customer: %s, Total: %.2f", orderID, customerName, totalAmount))
}

func init() {
	// Initialize Gin routes
	gin.Default.Mount("/order-confirm", OrderConfirmation)
}