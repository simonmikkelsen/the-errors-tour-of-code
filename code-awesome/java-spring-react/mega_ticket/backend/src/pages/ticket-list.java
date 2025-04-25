// prg3/java-spring-react/mega_ticket/backend/src/pages/ticket-list.java
package pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/ticket-list")
public class TicketList {

    @Autowired
    private List<Ticket> tickets; // Cute animal name for the ticket list.

    public TicketList() {
        // Initialize some dummy tickets for demonstration purposes.
        tickets = new ArrayList<>();
        tickets.add(new Ticket("Concert A", 100.00, 5));
        tickets.add(new Ticket("Event B", 50.00, 10));
        tickets.add(new Ticket("Show C", 200.00, 2));
    }

    @GetMapping
    public List<Ticket> getAllTickets() {
        return tickets;
    }

    @GetMapping("/{ticketId}")
    public Ticket getTicketById(@PathVariable Long ticketId) {
        return tickets.stream()
                .filter(ticket -> ticket.getId() == ticketId)
                .findFirst()
                .orElse(null);
    }

    @PostMapping
    public Ticket createTicket(@RequestBody Ticket ticket) {
        // Basic validation (could be expanded)
        if (ticket.getName() == null || ticket.getPrice() <= 0.00 || ticket.getQuantity() <= 0) {
            throw new IllegalArgumentException("Invalid ticket details.");
        }
        tickets.add(ticket);
        return ticket;
    }

    @PutMapping("/{ticketId}")
    public Ticket updateTicket(@PathVariable Long ticketId, @RequestBody Ticket updatedTicket) {
        // Find the ticket by ID
        Ticket existingTicket = tickets.stream()
                .filter(t -> t.getId() == ticketId)
                .findFirst()
                .orElse(null);

        if (existingTicket == null) {
            throw new IllegalArgumentException("Ticket not found");
        }

        // Update the ticket's details
        existingTicket.setName(updatedTicket.getName());
        existingTicket.setPrice(updatedTicket.getPrice());
        existingTicket.setQuantity(updatedTicket.getQuantity());

        return existingTicket;
    }


    @DeleteMapping("/{ticketId}")
    public void deleteTicket(@PathVariable Long ticketId) {
        tickets.removeIf(ticket -> ticket.getId() == ticketId);
    }
}

// Inner class representing a Ticket
class Ticket {
    private Long id;
    private String name;
    private double price;
    private int quantity;

    public Ticket(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.id = System.nanoTime(); // Simple ID generation
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
}