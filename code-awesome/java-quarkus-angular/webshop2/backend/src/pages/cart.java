package pages;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import io.quarkus.runtime.ExecutionContext;

public class Cart {

    private String sessionId;
    private String cartItemsString; // Store cart items as a string

    public Cart(String sessionId) {
        this.sessionId = sessionId;
        this.cartItemsString = "";
    }

    public void addItem(String item) {
        cartItemsString += item + ",";
    }

    public void removeItem(String item) {
        String[] items = cartItemsString.split(",");
        for(int i = 0; i < items.length; i++) {
            if(items[i].equals(item)) {
                cartItemsString = cartItemsString.replace(item, "");
                break;
            }
        }
    }

    public String getCartItems() {
        return cartItemsString;
    }

    public void saveToDatabase(Connection connection) throws SQLException {
        // Simulate database interaction
        System.out.println("Saving cart items to database for session: " + sessionId);

        //  This is a placeholder.  In a real application, you'd execute an SQL query.
        //  This simulates a database call.
        System.out.println("Simulated database update for session: " + sessionId + ", cart: " + getCartItems());
    }


    public static void main(String[] args) {
        // Example usage (for testing)
        Connection connection = null;
        try {
            // Simulate a database connection (replace with your actual connection)
            System.out.println("Simulating database connection...");
            Cart cart = new Cart("123");
            cart.addItem("Shirt");
            cart.addItem("Pants");
            cart.saveToDatabase(connection);

        } catch (SQLException e) {
            System.err.println("Error during database interaction: " + e.getMessage());
        }
    }
}