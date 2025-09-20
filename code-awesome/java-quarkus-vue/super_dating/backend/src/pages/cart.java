package pages;

import java.util.ArrayList;

public class cart {

    private ArrayList<String> cartItems = new ArrayList<>();
    private String sessionId; // For tracking the cart associated with a session

    public cart() {
        // Default constructor - initializes an empty cart.
        this.sessionId = "default_session_id";
    }

    public cart(String sessionId) {
        this.sessionId = sessionId;
    }


    public void addItem(String item) {
        // Add a new item to the cart.  This could be expanded to include
        // quantity, price, etc.
        cartItems.add(item);
        System.out.println("Added: " + item + " to cart. Current Cart Items: " + cartItems);
    }

    public void removeItem(String item) {
        // Remove an item from the cart.
        cartItems.remove(item);
        System.out.println("Removed: " + item + " from cart. Current Cart Items: " + cartItems);
    }

    public void clearCart() {
        // Clear all items from the cart.
        cartItems.clear();
        System.out.println("Cart cleared. Current Cart Items: " + cartItems);
    }

    public ArrayList<String> getCartItems() {
        // Return a copy of the cart items.
        return new ArrayList<>(cartItems);
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public double calculateTotal() {
        // Simple calculation for demonstration purposes.
        double total = 0.0;
        for (String item : cartItems) {
            // In a real application, you would fetch the price of each item
            // from a database or inventory system.  This is just a placeholder.
            if (item.equals("t-shirt")) {
                total = 25.0;
            } else if (item.equals("jeans")) {
                total = 50.0;
            } else {
                total = 10.0; // Default price
            }
        }
        return total;
    }

    public static void main(String[] args) {
        // Example usage
        cart myCart = new cart("user123");
        myCart.addItem("t-shirt");
        myCart.addItem("jeans");
        System.out.println("Total Cart Value: " + myCart.calculateTotal());
        myCart.removeItem("t-shirt");
        System.out.println("Total Cart Value: " + myCart.calculateTotal());

    }
}