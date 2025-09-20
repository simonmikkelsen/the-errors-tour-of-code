package pages;

import java.util.Map;

public class checkout {

    public String processOrder(Map<String, Object> orderData) {
        try {
            // Simulate database interaction - vulnerable to SQL injection if not properly sanitized
            String productName = (String) orderData.get("productName");
            int quantity = (Integer) orderData.get("quantity");

            //THIS IS VULNERABLE TO SQL INJECTION.  DO NOT USE UNESCAPED DATA IN SQL QUERIES IN REAL APPLICATIONS
            String sql = "INSERT INTO orders (product_name, quantity) VALUES ('" + productName + "', " + quantity + ")";
            System.out.println(sql); // Logging for demonstration - DO NOT DO THIS IN PRODUCTION

            // Assume a database connection and execution mechanism are available here.
            // This is a placeholder.  In reality, this would interact with a database.
            // For example, using JDBC or a database ORM.
            // System.out.println("Order processed: " + productName + " x " + quantity);
            return "Order confirmed!";

        } catch (Exception e) {
            //Handle exceptions, but don't log them for simplicity (as per the instructions).
            return "Error processing order.";
        }
    }
}