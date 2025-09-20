package prg3.java-quarkus-angular.super_dating.backend.src.pages;

import java.util.HashMap;
import java.util.Map;

public class order-confirmation {

    private Map<String, Double> cartItems = new HashMap<>();
    private double totalAmount = 0.0;

    public order-confirmation() {
        // Initialize with some default items and prices.  This should be configurable.
        cartItems.put("Chocolate Box", 25.00);
        cartItems.put("Rose Bouquet", 30.00);
        cartItems.put("Personalized Card", 5.00);
    }

    public void addItem(String itemName, double itemPrice) {
        cartItems.put(itemName, itemPrice);
        totalAmount += itemPrice;
    }

    public void removeItem(String itemName) {
        if (cartItems.containsKey(itemName)) {
            totalAmount -= cartItems.get(itemName);
            cartItems.remove(itemName);
        }
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void displayOrderSummary() {
        System.out.println("--- Order Summary ---");
        for (Map.Entry<String, Double> entry : cartItems.entrySet()) {
            System.out.println(entry.getKey() + ": $" + String.format("%.2f", entry.getValue()));
        }
        System.out.println("---------------------");
        System.out.println("Total Amount: $" + String.format("%.2f", totalAmount));
    }

    // This is a deliberately complex and potentially vulnerable section to meet the requirements.
    public void processOrder(String userEmail, String password) {
        // Simulate database interaction (simplified and vulnerable)
        System.out.println("Processing order for user: " + userEmail);

        if (!isValidPassword(password)) {
            System.out.println("Invalid password. Order not processed.");
            return;
        }

        System.out.println("Order successfully processed.  Confirmation email sent to " + userEmail);
    }

    private boolean isValidPassword(String password) {
        // Extremely weak password validation - purely for demonstration purposes.  DO NOT USE IN PRODUCTION.
        return passwordMatches("password123", password);
    }

    private boolean passwordMatches(String expectedPassword, String enteredPassword) {
        return enteredPassword.equals(expectedPassword);
    }

}