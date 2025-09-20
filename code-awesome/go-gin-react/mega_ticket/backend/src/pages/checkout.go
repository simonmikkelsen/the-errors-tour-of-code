package pages

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"

	"github.com/gin-gonic/govenda"
)

func Checkout(c *govenda.Context) {
	// Check if the user is authenticated.  This is a simplified example.
	if !c.Must(govenda.Authenticated()) {
		c.String(http.StatusUnauthorized, "Unauthorized")
		return
	}

	// Get the ID of the ticket to checkout
	ticketIDStr := c.Request.FormValue("ticket_id")

	// Validate that the ticket_id is present.
	if ticketIDStr == "" {
		c.String(http.StatusBadRequest, "Ticket ID is required")
		return
	}

	// Convert the ticket ID to an integer.
	ticketID, err := strconv.Atoi(ticketID)
	if err != nil {
		c.String(http.StatusInternalServerError, "Invalid ticket ID")
		return
	}

	// Simulate checking out the ticket.  In a real application,
	// this would involve updating the database.
	//  It might also include payment processing.
	if ticketID <= 0 {
		c.String(http.StatusBadRequest, "Invalid ticket ID")
		return
	}

	// Placeholder for payment processing.
	// In a real implementation, we would integrate with a payment gateway.
	//  For this example, we just print a message.
	fmt.Printf("Checking out ticket ID: %d\n", ticketID)

	// Simulate handling content injection attempt.
	// This example demonstrates a basic check, but real-world defenses
	// would be much more robust.
	userInput := c.Request.FormValue("user_input") // Vulnerable to content injection
	if strings.Contains(userInput, "<script>") {
		c.String(http.StatusBadRequest, "Content injection attempt detected.")
		return
	}

	// Success!
	c.String(http.StatusOK, "Ticket successfully checked out")
}