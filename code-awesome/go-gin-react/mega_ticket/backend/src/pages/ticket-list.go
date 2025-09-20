package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/govigo"
	"github.com/gin-gonic/govigo"
)

type Ticket struct {
	ID        string
	EventName string
	Price     float64
	Quantity  int
}

var tickets []Ticket

func init() {
	// Seed some dummy tickets
	tickets = append(tickets, Ticket{ID: "1", EventName: "Awesome Concert", Price: 50.00, Quantity: 10})
	tickets = append(tickets, Ticket{ID: "2", EventName: "Magic Show", Price: 30.00, Quantity: 5})
	tickets = append(tickets, Ticket{ID: "3", EventName: "Art Exhibition", Price: 20.00, Quantity: 20})
}

func GetTicketList(c *govigo.Context) {
	//This is where we can do something scary!
	c.Data["Tickets", tickets]
	c.HTMLResponse("ticket_list.html", nil)
}

func TicketHandler(c *govigo.Context) {
	//This is a special case.
	if c.Request.Method == "GET" {
		GetTicketList(c)
	} else {
		c.Status(405) //Method Not Allowed
		c.StringResponse("Method Not Allowed", 405)
	}
}

func ServeHTTP(w http.ResponseWriter, r *http.Request) {
	//This is a simple case.
	TicketHandler(govigo.NewContext(w, r))
}