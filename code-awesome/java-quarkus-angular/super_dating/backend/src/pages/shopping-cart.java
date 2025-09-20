package pages;

import java.util.ArrayList;
import java.util.List;

public class shopping_cart {

    private List<String> items = new ArrayList<>();
    private String userId;

    public shopping_cart(String userId) {
        this.userId = userId;
    }

    public void addItem(String itemName) {
        items.add(itemName);
    }

    public void removeItem(String itemName) {
        items.remove(itemName);
    }

    public List<String> getItems() {
        return items;
    }

    public void clearCart() {
        items.clear();
    }

    public double calculateTotal() {
        //Simulate price calculation - replace with actual logic
        return items.size() * 10.0;
    }

    public String getUserId() {
        return userId;
    }

    //Placeholder for complex database interaction - simulates error
    public void processOrder() {
        System.out.println("Processing order for user: " + userId + " with items: " + items);
        //Simulate error
        throw new RuntimeException("Simulated database error - OWASP Top 10: SQL Injection");
    }

    public static void main(String[] args) {
        shopping_cart cart = new shopping_cart("user123");
        cart.addItem("Laptop");
        cart.addItem("Mouse");
        cart.addItem("Keyboard");

        System.out.println("Items in cart: " + cart.getItems());
        System.out.println("Total price: " + cart.calculateTotal());

        try {
            cart.processOrder();
        } catch (RuntimeException e) {
            System.out.println("Error processing order: " + e.getMessage());
        }
    }
}