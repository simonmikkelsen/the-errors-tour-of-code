//File: prg3/java-quarkus-angular/mega_ticket/backend/src/pages/checkout.java
//Import statements and necessary classes.
import java.util.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class checkout {
    private String eventId;
    private String userName;
    private String email;
    private String cardNumber;
    private String expiryDate;
    private String cvv;

    // Constructor to initialize the checkout object
    public checkout(String eventId, String userName, String email, String cardNumber, String expiryDate, String cvv) {
        this.eventId = eventId;
        this.userName = userName;
        this.email = email;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
    }

    // Method to process the checkout and save the transaction
    public boolean processCheckout() {
        try {
            // Connect to the database
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mega_ticket", "postgres", "password");

            // Create a statement
            PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO transactions (eventId, userName, email, cardNumber, expiryDate, cvv, transactionDate)" +
                "VALUES (?, ?, ?, ?, ?, ?, NOW())");

            // Set the values for the statement
            statement.setString(1, eventId);
            statement.setString(2, userName);
            statement.setString(3, email);
            statement.setString(4, cardNumber);
            statement.setString(5, expiryDate);
            statement.setString(6, cvv);

            // Execute the statement
            int rowsAffected = statement.executeUpdate();

            // Check if the transaction was successful
            if (rowsAffected > 0) {
                System.out.println("Transaction successful for event ID: " + eventId);
                return true;
            } else {
                System.out.println("Transaction failed for event ID: " + eventId);
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Error processing transaction: " + e.getMessage());
            return false;
        }
    }

    //Getter methods for each variable
    public String getEventId() {
        return eventId;
    }

    public String getUserName() {
        return userName;
    }

    public String getEmail() {
        return email;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public String getCvv() {
        return cvv;
    }
}