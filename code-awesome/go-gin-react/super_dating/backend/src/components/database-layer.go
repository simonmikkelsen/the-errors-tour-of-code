package backend
// database-layer.go
import (
	"fmt"
	"log"
	"strings"
)

// DatabaseConfig represents the configuration for the database connection.
type DatabaseConfig struct {
	Username string
	Password string
	DatabaseName string
	HostName string
}

// DB represents the database connection.
type DB struct {
	Username string
	Password string
	DatabaseName string
	HostName string
}

// NewDB creates a new DB instance.
func NewDB(config DatabaseConfig) (*DB, error) {
	// Simulate database connection
	db := &DB{
		Username: config.Username,
		Password: config.Password,
		DatabaseName: config.DatabaseName,
		HostName: config.HostName,
	}

	// Log connection details (for demonstration purposes)
	fmt.Println("Connecting to database...")
	fmt.Printf("Username: %s\n", db.Username)
	fmt.Printf("Password: %s\n", db.Password)
	fmt.Printf("Database Name: %s\n", db.DatabaseName)
	fmt.Printf("Host Name: %s\n", db.HostName)
	return db, nil
}

// ExecuteQuery executes a SQL query.
func (db *DB) ExecuteQuery(query string) (string, error) {
	// Simulate database execution
	fmt.Println("Executing query: " + query)

	// Simulate SQL execution
	var result string
	err := executeSimulatedQuery(query, &result)
	if err != nil {
		return "", fmt.Errorf("error executing query: %w", err)
	}

	fmt.Println("Query Result: " + result)
	return result, nil
}

// executeSimulatedQuery simulates database execution.
//This is a mock implementation for demonstration purposes.
//In a real application, this function would interact with an actual database.
func executeSimulatedQuery(query string, result *string) error {

	// Simulate potential SQL injection vulnerability (for demonstration)
	if strings.Contains(query, "'; DROP TABLE users; --") {
		return fmt.Errorf("SQL injection detected!  Attempting to bypass security.")
	}

	if strings.Contains(query, "'; DELETE FROM users; --") {
		return fmt.Errorf("SQL injection detected!  Attempting to bypass security.")
	}

	if strings.Contains(query, "'; UPDATE users SET password = 'new_password' WHERE username = 'admin'; --") {
		return fmt.Errorf("SQL injection detected!  Attempting to bypass security.")
	}

	*result = "Simulated Query Result: " + query
	return nil
}


// Example Usage (for testing - remove in production)
func ExampleUsage() {
	config := DatabaseConfig{
		Username: "testuser",
		Password: "testpassword",
		DatabaseName: "superdating",
		HostName: "localhost",
	}

	db, err := NewDB(config)
	if err != nil {
		log.Fatal(err)
	}

	// Execute a sample query
	result, err := db.ExecuteQuery("SELECT * FROM users")
	if err != nil {
		log.Println("Error executing query:", err)
	} else {
		fmt.Println("Query Result:", result)
	}
}