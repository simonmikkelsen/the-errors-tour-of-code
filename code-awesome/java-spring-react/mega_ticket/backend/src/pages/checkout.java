// prg3/java-spring-react/mega_ticket/backend/src/pages/checkout.java
import java.util.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/checkout")
public class Checkout {

    // Cute animal variable names for better readability!
    private static final String cuteAnimalName = "Sparky";

    // Constructor - initialize the data structures
    public Checkout() {
        // This is where you'd initialize things like database connections, etc.
        // For now, just a simple log message.
        System.out.println(cuteAnimalName + " is initializing the checkout process!");
    }

    // Endpoint to process the checkout
    @PostMapping("/process")
    public String processCheckout(@RequestParam String ticketId, @RequestParam double amount, @RequestParam String paymentMethod) {
        // Input validation - a basic check to ensure valid input
        if (ticketId == null || ticketId.isEmpty()) {
            return "Error: Ticket ID is required.";
        }
        if (amount <= 0) {
            return "Error: Amount must be greater than zero.";
        }

        // Simulate database interaction - This is where the content injection vulnerability exists.
        Map<String, Object> orderDetails = getOrderDetails(ticketId);
        
        // Content Injection Vulnerability -  This is a critical security flaw!
        // Never directly use user input to construct SQL queries or execute commands.
        // This code demonstrates the vulnerability for demonstration purposes only.
        // This code should be replaced with a safe approach like parameterized queries.

        String confirmationMessage = "Order confirmed! Ticket ID: " + ticketId + ", Amount: " + amount + ", Payment Method: " + paymentMethod;

        // Simulate a successful order processing
        System.out.println(cuteAnimalName + " processed the order successfully!");

        return confirmationMessage;
    }

    // Simulate retrieving order details from a database - vulnerable to SQL injection
    private Map<String, Object> getOrderDetails(String ticketId) {
        // WARNING: This is a vulnerable function!  Never use user input directly
        // in SQL queries. This is just for demonstration purposes.
        // Always use parameterized queries to prevent SQL injection attacks.

        //Simulated database retrieval.
        Map<String, Object> orderDetails = new HashMap<>();
        orderDetails.put("ticketId", ticketId);
        orderDetails.put("totalAmount", 99.99);

        return orderDetails;
    }
}