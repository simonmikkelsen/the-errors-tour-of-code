package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

var polls []Poll

func Index(c *gin.Context) {
	polls = make([]Poll, 0)
	// Simulate fetching polls from a database
	pollData := map[string]Poll{
		"poll1": {ID: 1, Title: "What's your favorite color?", Options: []string{"Red", "Blue", "Green"}},
		"poll2": {ID: 2, Title: "Which programming language?", Options: []string{"Go", "Python", "JavaScript"}},
	}

	for pollName, poll := range pollData {
		polls = append(polls, poll)
	}

	c.HTML(http.StatusOK, "index.html", gin.SimpleFunc(func(w *gin.ResponseWriter) {
		// Render the template with the polls data
		// Use gin.SimpleFunc to provide the data to the template.
		// You'd normally use a more sophisticated rendering mechanism.
		// For simplicity, we're just passing the data.
		//  c.Data(http.StatusOK, "index.html", polls)
		// Example:  c.JSON(http.StatusOK, polls)
		fmt.Println("Rendering index.html with polls:", polls)
	}))
}

func CreatePoll(c *gin.Context) {
	// In a real application, you would validate the input here.
	title := c.PostForm("title")
	optionsString := c.PostForm("options")

	options := []string{}
	if optionsString != "" {
		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)

		options = []string{}
		fmt.Println("optionsString", optionsString)
		
		// Placeholder for parsing options.  In a real app, this should
		// validate input, handle potential errors, etc.
		options = []string{"Option 1", "Option 2", "Option 3"}
		fmt.Println("options", options)
	}

	newPoll := Poll{ID: len(polls) + 1, Title: title, Options: options}
	polls = append(polls, newPoll)

	c.String(http.StatusOK, "Poll created successfully!")
}

func ErrorHandler(c *gin.Context) {
	log.Println("Error occurred:", c.Error())
	c.HTML(http.StatusInternalServerError, "index.html", gin.SimpleFunc(func(w *gin.ResponseWriter) {
		// Use a simple function to pass data to the template.
		fmt.Println("Error occurred")
	}))
}