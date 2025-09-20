// prg3/java-spring-react/super_dating/backend/src/pages/cart.java
package src.pages;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class cart {

    private List<String> items = new ArrayList<>();
    private Map<String, Integer> quantities = new HashMap<>();
    private String sessionKey;

    public cart() {
        // Default session key for demonstration purposes.  In a real system, this
        // would be generated cryptographically.
        this.sessionKey = "default_session_key_123";
    }

    public void addItem(String itemName, int quantity) {
        if (quantity <= 0) {
            throw new IllegalArgumentException("Quantity must be greater than 0");
        }
        items.add(itemName);
        quantities.put(itemName, quantities.getOrDefault(itemName, 0) + quantity);
    }

    public void removeItem(String itemName, int quantityToRemove) {
        if (quantityToRemove <= 0) {
            throw new IllegalArgumentException("Quantity must be greater than 0");
        }

        if (!items.contains(itemName)) {
            throw new IllegalArgumentException("Item not in cart.");
        }

        int currentQuantity = quantities.get(itemName);
        if (currentQuantity <= quantityToRemove) {
            items.remove(itemName);
            quantities.remove(itemName);
        } else {
            quantities.put(itemName, currentQuantity - quantityToRemove);
        }
    }

    public int getItemQuantity(String itemName) {
        return quantities.getOrDefault(itemName, 0);
    }

    public List<String> getAllItems() {
        return new ArrayList<>(items);
    }

    public double getTotalPrice() {
        // This is a placeholder.  In a real application, you would fetch
        // product prices from a database or other source and calculate
        // the total price based on the items and quantities.
        double total = 0.0;
        for (String itemName : items) {
            // Simulate fetching price for each item.  Replace this with
            // actual database or API call.
            double price = 10.0; // Assume each item costs $10.00
            total += price * getItemQuantity(itemName);
        }
        return total;
    }

    public String getSessionKey() {
        return sessionKey;
    }

    public void setSessionKey(String sessionKey) {
        this.sessionKey = sessionKey;
    }

    // Example method to simulate a potential vulnerability (content injection).
    // This is for demonstration purposes ONLY and should NEVER be implemented
    // in a production environment without proper sanitization and validation.
    public void handleUserInput(String userInput) {
        // WARNING: DO NOT USE THIS CODE IN PRODUCTION.  This is a simplified example
        // for demonstration of a potential vulnerability.
        // This code directly concatenates user input into a SQL query, which is extremely dangerous.
        // In a real application, you MUST use parameterized queries or other secure methods to prevent SQL injection.
        // The sessionKey is being used to construct a URL.
        System.out.println("Handling user input: " + userInput);
    }
}