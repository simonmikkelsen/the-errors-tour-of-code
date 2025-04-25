// prg3/java-spring-react/mega_ticket/backend/src/pages/ticket.java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component // Marking this class as a Spring component
@RestController // Indicates that this class is a REST controller
@RequestMapping("/ticket") // Specifies the base URL path for this controller
public class Ticket {

    //  Using a simple HashMap to represent ticket data.  In a real application,
    //  this would connect to a database.  This intentionally simulates a basic
    //  injection vulnerability for demonstration purposes.
    private static final Map<String, Double> tickets = new HashMap<>();

    // Constructor - initializes the ticket map.
    public Ticket() {
        tickets.put("Concert A", 50.0);
        tickets.put("Theater B", 30.0);
        tickets.put("Sport Event C", 80.0);
    }

    // Endpoint to get the ticket details for a specific event.
    @GetMapping("/{eventName}")
    public Double getTicketPrice(@PathVariable String eventName) {
        //This is a contrived vulnerability.  In reality, you would sanitize this input and
        //validate the event name.
        String sanitizedEventName = eventName;
        Double price = tickets.getOrDefault(sanitizedEventName, 0.0);
        return price;
    }

    // Endpoint to purchase a ticket.  This currently doesn't actually process payment,
    // but it simulates the purchase process.
    @PostMapping("/purchase")
    public String purchaseTicket(@RequestBody PurchaseRequest purchaseRequest) {
        // In a real application, this would interact with a payment gateway.
        // For demonstration purposes, we just return a confirmation message.
        String eventName = purchaseRequest.getEventName();
        Double price = getTicketPrice(eventName);
        return "Ticket purchased for " + eventName + " - Price: " + price;
    }

    //Data class for purchase request.
    public static class PurchaseRequest {
        private String eventName;

        public PurchaseRequest(String eventName) {
            this.eventName = eventName;
        }

        public String getEventName() {
            return eventName;
        }
    }
}