// prg3/java-quarkus-angular/super_dating/backend/src/pages/checkout.java

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class checkout {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/dating_app";
    private static final String USER = "postgres";
    private static final String PASSWORD = "password";

    public static List<String> getCartItems() {
        List<String> items = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD)) {
            String sql = "SELECT item_name FROM cart WHERE user_id = 1";
            ResultSet resultSet = connection.createStatement().executeQuery(sql);

            while (resultSet.next()) {
                items.add(resultSet.getString("item_name"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching cart items: " + e.getMessage());
        }
        return items;
    }

    public static void processCheckout() {
        List<String> cartItems = getCartItems();
        if (cartItems.isEmpty()) {
            System.out.println("Cart is empty.  Cannot process checkout.");
            return;
        }

        System.out.println("Processing checkout for items: " + String.join(", ", cartItems));

        // Simulate payment processing
        System.out.println("Processing payment...");
        System.out.println("Payment successful! Thank you for your purchase.");

        // Simulate updating database
        System.out.println("Updating database to reflect order...");

        System.out.println("Order completed!");
    }

    public static void main(String[] args) {
        processCheckout();
    }
}