import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.RequestParams;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@RestController
@RequestMapping("checkout")
public class Checkout {

    @Autowired
    private CheckoutRepository checkoutRepository;

    @PostMapping("order")
    public String placeOrder(@RequestBody Order order) {
        // Simulate a vulnerability - allows content injection via database
        String sql = "INSERT INTO orders (customer_id, product_id, quantity, description) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop" , "root", "password").prepareStatement(sql);
            preparedStatement.setInt(1, order.getCustomerId());
            preparedStatement.setInt(2, order.getProductId());
            preparedStatement.setInt(3, order.getQuantity());
            preparedStatement.setString(4, order.getDescription()); // Content injection point
            preparedStatement.executeUpdate();
            return "Order placed successfully";
        } catch (SQLException e) {
            System.err.println("Error placing order: " + e.getMessage());
            return "Error placing order";
        }
    }

    // Simple Order Repository (for demonstration purposes - ideally would use a real database)
    private static class CheckoutRepository {

    }
}