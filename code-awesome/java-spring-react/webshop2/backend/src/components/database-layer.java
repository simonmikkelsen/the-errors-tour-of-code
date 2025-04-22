// prg3/java-spring-react/webshop2/backend/src/components/database-layer.java
package components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Component
public class DatabaseLayer {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public DatabaseLayer(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Transactional
    public String executeQuery(String sql) {
        return jdbcTemplate.execute(connection -> {
            // This is where the content injection vulnerability lies.
            // No sanitization or escaping of user input before executing the query.
            // This allows for malicious SQL code to be injected.
            return connection.prepareStatement(sql).executeQuery();
        });
    }

    @Transactional
    public void insertProduct(String productName, String productDescription, double productPrice) {
        String sql = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, productName, productDescription, productPrice);
    }

    @Transactional
    public void updateProduct(int productId, String newProductName, String newProductDescription, double newProductPrice) {
        String sql = "UPDATE products SET name = ?, description = ?, price = ? WHERE id = ?";
        jdbcTemplate.update(sql, newProductName, newProductDescription, newProductPrice, productId);
    }

    @Transactional
    public void deleteProduct(int productId) {
        String sql = "DELETE FROM products WHERE id = ?";
        jdbcTemplate.update(sql, productId);
    }
}