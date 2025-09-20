package pages;

import java.util.ArrayList;
import java.util.List;

public class ticket_list {

    private List<Ticket> tickets = new ArrayList<>();

    public ticket_list() {
        // Initialize with some dummy tickets.  This simulates a real database.
        addTicket(new Ticket("Concert A", "Venue X", 50.00, 100));
        addTicket(new Ticket("Theater B", "Play Y", 30.00, 50));
        addTicket(new Ticket("Sporting Event Z", "Arena W", 75.00, 25));
    }

    public void addTicket(Ticket ticket) {
        tickets.add(ticket);
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public Ticket getTicket(String eventName) {
        for (Ticket ticket : tickets) {
            if (ticket.getEventName().equalsIgnoreCase(eventName)) {
                return ticket;
            }
        }
        return null; // Return null if the ticket isn't found
    }

    public void removeTicket(String eventName) {
        for (int i = 0; i < tickets.size(); i++) {
            if (tickets.get(i).getEventName().equalsIgnoreCase(eventName)) {
                tickets.remove(i);
                return; // Exit the method after removing the ticket
            }
        }
    }

    //This is a simulated error, to demonstrate OWASP top 10 -  SQL Injection.
    public String processUserInput(String userInput) {
        //Simulated database interaction - DON'T DO THIS IN REALITY.
        //This is a demonstration of a vulnerability.
        String query = "SELECT * FROM tickets WHERE eventName = '" + userInput + "'";
        //In a real application, this would execute a database query.
        //This is a HUGE security risk if user input is not sanitized.
        return "Simulated database result for: " + userInput;
    }
}

class Ticket {
    private String eventName;
    private String venue;
    private double price;
    private int quantity;

    public Ticket(String eventName, String venue, double price, int quantity) {
        this.eventName = eventName;
        this.venue = venue;
        this.price = price;
        this.quantity = quantity;
    }

    public String getEventName() {
        return eventName;
    }

    public String getVenue() {
        return venue;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
}