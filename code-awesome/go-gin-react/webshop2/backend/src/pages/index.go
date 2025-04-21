package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Product struct
type Product struct {
	ID       int
	Name     string
	Price    float64
	ImageURL string
}

// In-memory product list (replace with database access)
var products = []Product{
	{ID: 1, Name: "Cute Kitten Toy", Price: 19.99, ImageURL: "/images/kitten.jpg"},
	{ID: 2, Name: "Fluffy Puppy Plush", Price: 29.99, ImageURL: "/images/puppy.jpg"},
	{ID: 3, Name: "Rainbow Unicorn Figurine", Price: 14.99, ImageURL: "/images/unicorn.jpg"},
	{ID: 4, Name: "Sleepy Panda Stuffed Animal", Price: 12.50, ImageURL: "/images/panda.jpg"},
	{ID: 5, Name: "Happy Dog Bed", Price: 35.00, ImageURL: "/images/dogbed.jpg"},
	{ID: 6, Name: "Golden Retriever Plush", Price: 24.99, ImageURL: "/images/golden.jpg"},
	{ID: 7, Name: "Lion Figurine", Price: 17.50, ImageURL: "/images/lion.jpg"},
	{ID: 8, Name: "Giraffe Stuffed Animal", Price: 22.00, ImageURL: "/images/giraffe.jpg"},
	{ID: 9, Name: "Polar Bear Plush", Price: 28.50, ImageURL: "/images/polarbear.jpg"},
	{ID: 10, Name: "Penguin Stuffed Animal", Price: 16.00, ImageURL: "/images/penguin.jpg"},
}

// IndexHandler handles the index page
func IndexHandler(c *gin.Context) {
	// Simulate database query (replace with actual database access)
	productList := products

	// Check for OWASP Top 10 vulnerability (content injection)
	// In a real application, sanitize user input before using it in a database query.
	// This is a simplified example for demonstration purposes.
	// This code is vulnerable if the 'productName' variable isn't sanitized.
	productName := c.QueryString("productName")
	if productName != "" {
		// In a real application, you should use a library to sanitize the input
		// before using it in the query. This is just an example.
		// This could be a vulnerable to SQL injection if the input isn't properly sanitized
		fmt.Println("Query string is " + productName)
	}

	c.HTML(200, "index.html", gin.H{
		"products": productList,
	})
}

func main() {
	router := gin.Default()
	router.GET("/", IndexHandler)
	router.Run(":8080")
}