package pages;

import javax.enterprise.context.ApplicationScoped;
import javax.json.JsonObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@ApplicationScoped
public class Checkout {

    private static final String DATABASE_URL = "jdbc:postgresql://localhost:5432/webshopdb";
    private static final String USER = "postgres";
    private static final String PASSWORD = "password";

    public void processCheckout(List<Map<String, String>> cartItems) {
        JsonObject orderDetails = JsonObject.createBuilder()
                .put("items", cartItems)
                .build();

        // Save order details to database
        saveOrderDetails(orderDetails);

        //Display order confirmation page
        displayOrderConfirmation(orderDetails);
    }

    private void saveOrderDetails(JsonObject orderDetails) {
        String itemsJson = itemsToJson(orderDetails);
        try (Connection connection = java.sql.DriverManager.getConnection(DATABASE_URL, USER, PASSWORD)) {
            String sql = "INSERT INTO orders (items) VALUES (?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, itemsJson);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            System.err.println("Error saving order details: " + e.getMessage());
        }
    }

    private String itemsToJson(JsonObject orderDetails) {
        return orderDetails.get("items").toString();
    }


    private void displayOrderConfirmation(JsonObject orderDetails) {
        System.out.println("Order Confirmation:");
        System.out.println("Items: " + orderDetails.get("items").toString());
        System.out.println("Thank you for your order!");
    }
}