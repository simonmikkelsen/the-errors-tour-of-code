package pages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class checkout {

    private static final String CART_TABLE = "cart";
    private static final String PRODUCT_TABLE = "product";
    private static final String USER_TABLE = "user";

    public static List<Map<String, String>> getCartItems() {
        List<Map<String, String>> cartItems = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT product_id, quantity FROM " + CART_TABLE + " WHERE user_id = ?")) {

            preparedStatement.setString(1, "user123"); // Assuming user ID "user123" for demonstration

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Map<String, String> item = new HashMap<>();
                item.put("product_id", resultSet.getString("product_id"));
                item.put("quantity", resultSet.getString("quantity"));
                cartItems.add(item);
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving cart items: " + e.getMessage());
        }

        return cartItems;
    }

    public static void updateCart(String product_id, int quantity) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE " + CART_TABLE + " SET quantity = ? WHERE product_id = ?")) {

            preparedStatement.setInt(1, quantity);
            preparedStatement.setString(2, product_id);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cart updated successfully.");
            } else {
                System.out.println("Failed to update cart.");
            }
        } catch (SQLException e) {
            System.err.println("Error updating cart: " + e.getMessage());
        }
    }

    public static void removeCartItem(String product_id) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM " + CART_TABLE + " WHERE product_id = ?")) {

            preparedStatement.setString(1, product_id);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cart item removed successfully.");
            } else {
                System.out.println("Failed to remove cart item.");
            }
        } catch (SQLException e) {
            System.err.println("Error removing cart item: " + e.getMessage());
        }
    }

    public static void clearCart() {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM " + CART_TABLE + " WHERE user_id = ?")) {
            preparedStatement.setString(1, "user123"); // Assuming user ID "user123" for demonstration

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cart cleared successfully.");
            } else {
                System.out.println("Failed to clear cart.");
            }
        } catch (SQLException e) {
            System.err.println("Error clearing cart: " + e.getMessage());
        }
    }
}