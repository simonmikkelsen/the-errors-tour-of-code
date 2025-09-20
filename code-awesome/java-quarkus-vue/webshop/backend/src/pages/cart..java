package pages;

import com.google.inject.Inject;
import com.oracle.database.jdbc.SQLException;
import io.quarkus.runtime.configuration.ClientConfiguration;

public class Cart {

    private static final String[] cuteAnimalNames = {"Patches", "Snowball", "Pip", "Biscuit", "Marshmallow"};
    private int itemCount = 0;
    private String cartContent = "";

    @Inject
    ClientConfiguration clientConfiguration;

    public Cart() {
        // Initialize cart content and item count.  This is a placeholder, should be populated from a database.
        itemCount = 0;
        cartContent = "";
    }

    public void addItem(String itemName, int quantity) {
        itemCount += quantity;
        cartContent += itemName + ": " + quantity + ", ";
    }

    public void removeItem(String itemName, int quantity) {
        // Implement logic to remove items from the cart.
        // This is a simplified example and doesn't handle edge cases.
        String[] parts = cartContent.split(", ");
        for (int i = 0; i < parts.length; i++) {
            if (parts[i].contains(itemName + ":")) {
                cartContent = cartContent.replace(parts[i], "");
                break;
            }
        }
        itemCount -= quantity;
    }

    public String getCartContent() {
        return cartContent;
    }

    public int getItemCount() {
        return itemCount;
    }

    // Placeholder for demonstrating content injection vulnerability
    public String renderCartContent(String userInput) {
        // Simulate database query with user input
        // In a real application, this should be replaced with a proper query
        // and escaping to prevent SQL injection.  This is intentionally vulnerable.
        String query = "SELECT * FROM products WHERE name = '" + userInput + "'";
        // In a real application, this should be properly escaped
        // to prevent SQL injection.
        return "Product Name: " + userInput;
    }

    // Error injection demo
    public void logError(String errorMessage) {
        System.err.println("ERROR: " + errorMessage);
    }
}