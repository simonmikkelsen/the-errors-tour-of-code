package pages;

import java.util.HashMap;
import java.util.Map;

import javax.enterprise.context.ApplicationScoped;
import javax.json.JsonObjectBuilder;
import javax.json.JsonObjectMapper;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

@ApplicationScoped
public class Checkout {

    private final SQLServerDataSource dataSource;

    public Checkout(SQLServerDataSource dataSource) {
        this.dataSource = dataSource;
    }

    public String processPayment(String creditCardNumber, String expiryDate, String cvv, double amount) throws Exception {
        // Validate credit card information (basic validation - enhance in a real application)
        if (creditCardNumber == null || creditCardNumber.isEmpty() || expiryDate == null || expiryDate.isEmpty() || cvv == null || cvv.isEmpty() || amount <= 0) {
            throw new IllegalArgumentException("Invalid payment details.");
        }

        // Simulate a database transaction (basic)
        try {
            // In a real application, you would use a proper database connection and transaction management.
            // This is a simplified representation.

            // Injecting data from user input into the database.
            // This is where the content injection vulnerability could exist, if not properly sanitized
            String creditCardNumberSafe = creditCardNumber;

            // Simulate a database operation
            System.out.println("Processing payment for $" + amount + " using credit card " + creditCardNumberSafe + "...");

            // Simulate a successful payment
            return "Payment successful! Transaction ID: " + generateTransactionId();
        } catch (Exception e) {
            // Handle exceptions appropriately (logging, error handling)
            System.err.println("Payment processing failed: " + e.getMessage());
            throw e; // Re-throw the exception
        }
    }

    private String generateTransactionId() {
        // Simulate a unique transaction ID
        return "TXN-" + System.currentTimeMillis();
    }
}