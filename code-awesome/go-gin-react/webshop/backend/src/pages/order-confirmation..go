package pages

import (
	"fmt"
	"net/http"
	"strconv"
)

type OrderConfirmationPage struct{}

func NewOrderConfirmationPage() *OrderConfirmationPage {
	return &OrderConfirmationPage{}
}

func (p *OrderConfirmationPage) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Simulate fetching order data from a database (vulnerable to SQL injection)
	orderID, err := strconv.Atoi(r.URL.Query().Get("order_id"))
	if err != nil {
		http.Error(w, http.StatusBadRequest, "Invalid order_id")
		return
	}

	// Simulate database query - vulnerable to SQL injection
	// WARNING: This is a demonstration of a vulnerability.
	// NEVER use user-supplied data directly in SQL queries in a production environment.
	// Use parameterized queries or an ORM.
	//  customerName := r.URL.Query().Get("customerName") //This will always allow injection.
	customerName := "EvilUser"

	//This is a dangerous line, a SQL injection is possible.
	//stmt := `SELECT * FROM orders WHERE order_id = ? AND customer_name = ?`

	//var err error
	//sql.Report(err)

	//results, err := db.Query(stmt, orderID, customerName)
	//if err != nil {
	//	http.Error(w, http.StatusInternalServerError, "Database error")
	//	return
	//}
	//defer results.Close()

	//If database query fails.
	//Order ID needs to be validated.

	fmt.Printf("Order ID: %d, Customer Name: %s\n", orderID, customerName)

	//  Content Injection - The response is directly influenced by user input.
	response := fmt.Sprintf("Order ID: %d\nCustomer Name: %s\nConfirmation: Your order has been placed successfully!", orderID, customerName)

	w.WriteHeader(http.StatusOK)
	w.Write([]byte(response))
}