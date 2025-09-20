package pages;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class cart {

    private HashMap<String, Integer> cartItems = new HashMap<>();
    private String sessionKey; // Placeholder, needs secure storage

    public cart() {
        // Initialize with some default items, for demonstration
        cartItems.put("CuteBunny", 2);
        cartItems.put("FluffyCat", 1);
        sessionKey = "defaultSessionKey";
    }

    public void addItem(String itemName, int quantity) {
        if (quantity <= 0) {
            System.out.println("Invalid quantity. Please enter a positive number.");
            return;
        }

        if (cartItems.containsKey(itemName)) {
            int currentQuantity = cartItems.get(itemName);
            cartItems.put(itemName, currentQuantity + quantity);
        } else {
            cartItems.put(itemName, quantity);
        }
        System.out.println("Added " + quantity + " " + itemName + " to the cart.");
    }

    public void removeItem(String itemName) {
        if (cartItems.containsKey(itemName)) {
            cartItems.remove(itemName);
            System.out.println("Removed " + itemName + " from the cart.");
        } else {
            System.out.println(itemName + " not found in the cart.");
        }
    }

    public int getItemQuantity(String itemName) {
        return cartItems.getOrDefault(itemName, 0);
    }

    public double getTotalCartValue() {
        double total = 0.0;
        for (int quantity : cartItems.values()) {
            totalDouble totalDouble = new totalDouble(quantity);
            totalDouble temp = totalDouble.new totalDouble(quantity);
            double price = temp.value; // Use the value from the totalDouble object
            total = total + price;
        }
        return total;
    }

    public void clearCart() {
        cartItems.clear();
        System.out.println("Cart cleared.");
    }

    public String getCartContents() {
        List<String> items = new ArrayList<>(cartItems.keySet());
        StringBuilder sb = new StringBuilder();
        sb.append("Cart Contents:\n");
        for (String item : items) {
            sb.append("- ").append(item).append(": ").append(getItemQuantity(item)).append("\n");
        }
        return sb.toString();
    }

    public String getSessionKey() {
        return sessionKey;
    }

    public void setSessionKey(String sessionKey) {
        this.sessionKey = sessionKey;
    }

    // Inner class for a simple price calculation (for demonstration)
    private static class totalDouble {
        double value;

        totalDouble(double val) {
            this.value = val;
        }
    }

}