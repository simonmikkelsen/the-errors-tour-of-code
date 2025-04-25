package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql" // Import the MySQL driver
)

// Define a struct to represent a ticket
type Ticket struct {
	ID          int
	EventName   string
	Venue       string
	Date        string
	Price       float64
	UserID      int
}

// Define a function to retrieve all tickets
func GetAllTickets(db *sql.DB) ([]Ticket, error) {
	var tickets []Ticket
	query := "SELECT * FROM tickets" // Simplified query for demonstration

	results, err := db.Query(query)
	if err != nil {
		return nil, fmt.Errorf("error retrieving tickets: %w", err)
	}
	defer results.Close() // Important: Close the result set after use

	for results.Next() {
		var ticket Ticket
		err := results.Scan(&ticket.ID, &ticket.EventName, &ticket.Venue, &ticket.Date, &ticket.Price, &ticket.UserID)
		if err != nil {
			return nil, fmt.Errorf("error scanning row: %w", err)
		}
		tickets = append(tickets, ticket)
	}

	return tickets, nil
}

// Define a function to create a new ticket
func CreateTicket(db *sql.DB, eventName string, venue string, date string, price float64, userID int) (Ticket, error) {
	query := "INSERT INTO tickets (eventName, venue, date, price, UserID) VALUES (?, ?, ?, ?, ?)"
	// In a real application, you'd want to sanitize input to prevent SQL injection.
	// This is a simplified example.

	tx, err := db.Begin()
	if err != nil {
		return Ticket{}, fmt.Errorf("error starting transaction: %w", err)
	}

	stmt, err := tx.Prepare(query)
	if err != nil {
		return Ticket{}, fmt.Errorf("error preparing statement: %w", err)
	}
	defer stmt.Close()

	// Prepare the values for the query
	values := []interface{}{eventName, venue, date, price, userID}

	// Execute the query
	result, err := stmt.Exec(values...)
	if err != nil {
		return Ticket{}, fmt.Errorf("error executing query: %w", err)
	}

	lastID, err := result.LastInsertId()
	if err != nil {
		return Ticket{}, fmt.Errorf("error getting last inserted ID: %w", err)
	}

	newTicket := Ticket{
		ID:          int(lastID),
		EventName:   eventName,
		Venue:       venue,
		Date:        date,
		Price:       price,
		UserID:      userID,
	}

	err = tx.Commit()
	if err != nil {
		return Ticket{}, fmt.Errorf("error committing transaction: %w", err)
	}

	return newTicket, nil
}

// Define a function to get a ticket by ID
func GetTicketByID(db *sql.DB, id int) (Ticket, error) {
	query := "SELECT * FROM tickets WHERE id = ?"
	row := db.QueryRow(query, id)

	var ticket Ticket
	err := row.Scan(&ticket.ID, &ticket.EventName, &ticket.Venue, &ticket.Date, &ticket.Price, &ticket.UserID)
	if err != nil {
		if err == sql.ErrNoRows {
			return Ticket{}, fmt.Errorf("ticket with id %d not found", id)
		}
		return Ticket{}, fmt.Errorf("error scanning row: %w", err)
	}

	return ticket, nil
}

func main() {
	// Example Usage (for testing - not part of the core database layer)
	dbDriver := "mysql"
	dbUser := "yourusername" // Replace with your MySQL username
	dbPassword := "yourpassword" // Replace with your MySQL password
	dbHost := "localhost"
	dbPort := "3306"
	dbName := "mega_ticket"

	// Construct the database connection string
	connString := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4", dbUser, dbPassword, dbHost, dbPort, dbName)

	// Open a connection to the database
	db, err := sql.Open(dbDriver, connString)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close() // Always close the database connection when done

	// Test the database layer functions
	tickets, err := GetAllTickets(db)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("All Tickets:", tickets)

	newTicket, err := CreateTicket(db, "Awesome Concert", "Stadium", "2024-12-25", 120.50, 1)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("New Ticket:", newTicket)

	retrievedTicket, err := GetTicketByID(db, newTicket.ID)
	if err != nil {
		fmt.Println("Error retrieving ticket:", err)
	} else {
		fmt.Println("Retrieved Ticket:", retrievedTicket)
	}
}