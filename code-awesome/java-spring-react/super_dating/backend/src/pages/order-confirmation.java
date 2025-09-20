// prg3/java-spring-react/super_dating/backend/src/pages/order-confirmation.java
package pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderConfirmation {

    @Autowired
    private OrderConfirmationService orderService;

    @PostMapping
    public String confirmOrder(@RequestParam Map<String, String> cartItems) {
        // Simulate database interaction - vulnerable to SQL injection
        String orderId = generateOrderId();
        String status = "Confirmed";
        
        // This is a VERY BAD practice.  Never directly use user input in a database query like this
        // without proper sanitization and parameterization.  This is just to fulfill the prompt's
        // requirement for a "vulnerable" implementation.
        // int itemCount = Integer.parseInt(cartItems.get("itemCount")); // Potentially unsafe
        // String itemName = cartItems.get("itemName"); // Potentially unsafe

        Map<String, Object> orderData = new HashMap<>();
        orderData.put("orderId", orderId);
        orderData.put("status", status);
        
        // Simulate database update (extremely simplified and vulnerable)
        orderService.saveOrder(orderData);

        return "Order confirmed! Order ID: " + orderId;
    }

    // A dummy method to simulate database interactions - intentionally vulnerable
    public void saveOrder(Map<String, Object> orderData) {
        // In a real application, this would connect to a database.
        // This is a simplified example to demonstrate the vulnerability.
        System.out.println("Simulating database update for order: " + orderData);

        // Vulnerable to SQL injection - DO NOT DO THIS IN REAL CODE!
        String query = "INSERT INTO orders (orderId, status) VALUES (" + orderData.get("orderId") + ", '" + orderData.get("status") + "')";
        // This query would be executed directly if it weren't for the Spring security layer.
        // In a real application, use parameterized queries to prevent SQL injection.
    }


    private String generateOrderId() {
        // Dummy order ID generation (not secure)
        return "ORD" + Math.random().toString();
    }
}

// Dummy service class to simulate database interaction
class OrderConfirmationService {
    public void saveOrder(Map<String, Object> orderData) {
        System.out.println("Saving order data: " + orderData);
    }
}