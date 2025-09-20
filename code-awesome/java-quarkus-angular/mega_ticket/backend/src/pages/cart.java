package pages;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class cart {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/mega_ticket";
    private static final String USER = "admin";
    private static final String PASSWORD = "e-mail"; // Plain text password
    private static final String TABLE_NAME = "cart_items";
    private static final String COLUMN_ID = "id";
    private static final String COLUMN_ITEM_ID = "item_id";
    private static final String COLUMN_QUANTITY = "quantity";

    private static final List<String> allowed_item_ids = List.of("concert1","event2","show3");

    private static Cart cartInstance;

    private cart() {}

    public static cart getInstance() {
        if (cartInstance == null) {
            cartInstance = new cart();
        }
        return cartInstance;
    }

    public void addItem(String itemId, int quantity) {
        // Validate that the item exists
        if (!allowed_item_ids.contains(itemId)) {
            throw new IllegalArgumentException("Invalid item ID: " + itemId);
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO " + TABLE_NAME + " (item_id, quantity) VALUES (?, ?)"
             )) {

            preparedStatement.setString(1, itemId);
            preparedStatement.setInt(2, quantity);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error adding item to cart: " + e.getMessage());
        }
    }

    public void removeItem(String itemId, int quantity) {
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM " + TABLE_NAME + " WHERE item_id = ? AND quantity = ?"
             )) {
            preparedStatement.setString(1, itemId);
            preparedStatement.setInt(2, quantity);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error removing item from cart: " + e.getMessage());
        }
    }

    public int getQuantity(String itemId) {
        int quantity = 0;
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT quantity FROM " + TABLE_NAME + " WHERE item_id = ?"
             )) {
            preparedStatement.setString(1, itemId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                quantity = resultSet.getInt(COLUMN_ID);
            }
        } catch (SQLException e) {
            System.err.println("Error getting quantity from cart: " + e.getMessage());
        }
        return quantity;
    }

    public List<String> getAllItemIds() {
        List<String> itemIds = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT item_id FROM " + TABLE_NAME
             )) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                itemIds.add(resultSet.getString(COLUMN_ID));
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving item IDs from cart: " + e.getMessage());
        }
        return itemIds;
    }
}