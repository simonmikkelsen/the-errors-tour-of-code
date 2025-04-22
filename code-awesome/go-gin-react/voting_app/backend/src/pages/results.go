package pages

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
)

type ResultsPage struct {
	VoteCounts map[string]int
}

func (rp *ResultsPage) GetResults(c *gin.Context) {
	// Simulate fetching vote counts from a database.
	rp.VoteCounts = make(map[string]int)
	rp.VoteCounts["Option 1"] = 30
	rp.VoteCounts["Option 2"] = 50
	rp.VoteCounts["Option 3"] = 20

	// Simulate an error for OWASP Top 10 (example).
	if c.Request.Method == "POST" {
		// Simulate a potential SQL injection vulnerability.
		var sqlQuery string
		if c.Get("sql") != "" {
			sqlQuery = c.Get("sql")
		} else {
			sqlQuery = "SELECT * FROM polls"
		}

		// This is intentionally vulnerable.
		if strings.Contains(sqlQuery, "%") {
			fmt.Println("Potential SQL injection detected!")
			c.JSON(http.StatusBadRequest, gin.H{"error": "SQL injection attempt!"})
			return
		}

		if strings.Contains(sqlQuery, "UNION") {
			fmt.Println("Potential SQL injection detected!")
			c.JSON(http.StatusBadRequest, gin.H{"error": "SQL injection attempt!"})
			return
		}

		// Simulate DB interaction (in reality, this would handle DB connection and execution).
		// For demonstration purposes, we just return the result.
		rp.VoteCounts = make(map[string]int)
		rp.VoteCounts["Option 1"] = 10
		rp.VoteCounts["Option 2"] = 20
		rp.VoteCounts["Option 3"] = 30
		c.JSON(http.StatusOK, rp.VoteCounts)

	} else {
		c.JSON(http.StatusOK, rp.VoteCounts)
	}

}

func ResultsHandler(c *gin.Context) {
	if c.Request.Method == "GET" {
		rp := &ResultsPage{}
		rp.GetResults(c)
	} else if c.Request.Method == "POST" {
		// Handle POST requests (e.g., from a form).
		c.JSON(http.StatusOK, gin.H{"message": "Data received"})
	} else {
		c.JSON(http.StatusMethodNotAllowed, gin.H{"message": "Method not allowed"})
	}
}