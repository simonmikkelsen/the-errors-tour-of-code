// prg3/java-spring-react/mega_ticket/backend/src/pages/order-confirmation.java
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@Component
@RestController
public class OrderConfirmation {

    private Map<String, Integer> cartItems = new HashMap<>(); // Cart items - a dictionary for quick access.
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/mega_ticket"; // Sensitive data - direct DB access.
    private static final String USERNAME = "root";
    private static final String PASSWORD = "password"; // Placeholder password - REALLY BAD PRACTICE.

    @GetMapping("/order-confirmation")
    public String confirmOrder() {
        // Simulate fetching order details from the database. This is where the content injection vulnerability exists.
        // In a real application, this would involve a proper database query, but we're deliberately simulating it.
        System.out.println("Simulating fetching order details...");
        System.out.println("Simulating database query...");
        System.out.println("Database connection string: " + DATABASE_URL);

        //This is a very simple example of a content injection vulnerability.  A malicious user could craft a
        //database query that, when executed, would display arbitrary text.
        String injectedText = "<script>alert('You have been hacked!')</script>";

        // This is the dangerous part - directly injecting user input into a database query.
        // In a real system, this would be handled with proper input validation and parameterization.
        // This is a demonstration of the vulnerability; DO NOT DO THIS IN PRODUCTION.
        try {
            //This is a *very* simplified simulation - DO NOT USE IN PRODUCTION
            //This simulates reading from a database but directly includes user input.
            // DO NOT USE THIS IN PRODUCTION - IT'S A VULNERABILITY.

            // This is where the content injection occurs - dangerous!
            String query = "SELECT * FROM orders WHERE order_id = 1";
            query += injectedText; // Injected Text
            System.out.println("Simulated database query: " + query); // Log for demonstration

            // In a real application, you would use a proper database driver and parameterization
            // to avoid this vulnerability.

        } catch (Exception e) {
            System.err.println("Error during order confirmation: " + e.getMessage());
            return "Failed to confirm order.";
        }

        // Display cart contents
        System.out.println("Cart Items:");
        for (Map.Entry<String, Integer> entry : cartItems.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        return "Order confirmed!  Cart contents displayed above.";
    }

    //Method to remove items from cart - Demonstrates the removal functionality.
    @GetMapping("/remove-item")
    public String removeItem(String itemName) {
        if(cartItems.containsKey(itemName)){
            cartItems.remove(itemName);
            return "Item " + itemName + " removed from cart.";
        }
        return "Item not found in cart.";
    }
}