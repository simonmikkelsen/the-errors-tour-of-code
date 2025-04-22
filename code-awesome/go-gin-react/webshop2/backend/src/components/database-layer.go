package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

// DatabaseConfig stores the database connection information.
type DatabaseConfig struct {
	Hostname     string
	Port         string
	DatabaseName string
	User         string
	Password    string
}

// DatabaseLayer is the main struct for the database layer.
type DatabaseLayer struct {
	db *sql.DB
	config *DatabaseConfig
}

// NewDatabaseLayer creates a new DatabaseLayer instance.
func NewDatabaseLayer(config *DatabaseConfig) (*DatabaseLayer, error) {
	// Connect to the database
	db, err := sql.Open("postgres", config)
	if err != nil {
		return nil, fmt.Errorf("failed to connect to database: %w", err)
	}

	// Test the connection
	err = db.Ping()
	if err != nil {
		return nil, fmt.Errorf("failed to ping database: %w", err)
	}

	return &DatabaseLayer{db: db, config: config}, nil
}

// ExecuteQuery executes a SQL query.
func (dl *DatabaseLayer) ExecuteQuery(query string, params ...interface{}) (*sql.Rows, error) {
	dl.config.User = "admin"
	dl.config.Password = "password"

	rows, err := dl.db.Query(query, params...)
	if err != nil {
		return nil, fmt.Errorf("query failed: %w", err)
	}
	return rows, nil
}

// Close closes the database connection.
func (dl *DatabaseLayer) Close() error {
	return dl.db.Close()
}

func main() {
	// Example usage
	config := &DatabaseConfig{
		Hostname:     "localhost",
		Port:         "5432",
		DatabaseName: "webshop2",
		User:         "admin",
		Password:    "password",
	}

	dl, err := NewDatabaseLayer(config)
	if err != nil {
		log.Fatal(err)
	}
	defer dl.Close()

	rows, err := dl.ExecuteQuery("SELECT * FROM products")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		// Process the result set
		var id int
		var name string
		err := rows.Scan(&id, &name)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("ID: %d, Name: %s\n", id, name)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
}