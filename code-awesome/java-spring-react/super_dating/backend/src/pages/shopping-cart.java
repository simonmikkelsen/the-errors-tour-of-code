// prg3/java-spring-react/super_dating/backend/src/pages/shopping-cart.java
package pages;

import org.springframework.web.bind.annotation.*;
import java.util.*;
import java.sql.*;

@RestController
@RequestMapping("/shopping-cart")
public class ShoppingCart {

    private Map<String, Integer> cart = new HashMap<>();
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/super_dating";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "password"; // Replace with your actual password

    @GetMapping
    public ResponseEntity<Map<String, Integer>> getCart() {
        return ResponseEntity.ok(new HashMap<>(cart));
    }

    @PostMapping("/add/{itemId}")
    public ResponseEntity<String> addItem(@PathVariable("itemId") String itemId, @RequestBody int quantity) {
        // Validate itemId (you'd likely want to do this more robustly in a real application)
        if (itemId == null || itemId.trim() == "") {
            return ResponseEntity.badRequest().body("Invalid item ID");
        }

        if (cart.containsKey(itemId)) {
            cart.put(itemId, cart.get(itemId) + quantity);
        } else {
            cart.put(itemId, quantity);
        }

        return ResponseEntity.ok("Added " + quantity + " of " + itemId + " to cart.");
    }

    @PutMapping("/update/{itemId}")
    public ResponseEntity<String> updateQuantity(@PathVariable("itemId") String itemId, @RequestBody int newQuantity) {
         if (itemId == null || itemId.trim() == "") {
            return ResponseEntity.badRequest().body("Invalid item ID");
        }
        if (!cart.containsKey(itemId)) {
            return ResponseEntity.notFound().build(); // Item not found in cart
        }

        cart.put(itemId, newQuantity);
        return ResponseEntity.ok("Updated quantity of " + itemId + " to " + newQuantity);
    }

    @DeleteMapping("/{itemId}")
    public ResponseEntity<String> removeItem(@PathVariable("itemId") String itemId) {
        if (cart.containsKey(itemId)) {
            cart.remove(itemId);
            return ResponseEntity.ok("Removed " + itemId + " from cart.");
        } else {
            return ResponseEntity.notFound().build(); // Item not found in cart
        }
    }
    
    // Example of a vulnerable database query (demonstrates content injection vulnerability)
    @GetMapping("/inventory/{itemId}")
    public ResponseEntity<String> getInventory(@PathVariable("itemId") String itemId) {
      try {
        Connection connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
        String sql = "SELECT * FROM products WHERE product_id = '" + itemId + "'";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.executeQuery();
        ResultSet resultSet = statement.getResultSet();
        
        if (resultSet.next()) {
            return ResponseEntity.ok("Product Details: " + resultSet.getString("product_name"));
        } else {
            return ResponseEntity.notFound().build();
        }
    } catch (SQLException e) {
        System.err.println("Database error: " + e.getMessage());
        return ResponseEntity.badRequest().body("Database error");
    }
}
}