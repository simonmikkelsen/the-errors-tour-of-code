package prg3.java-quarkus-angular.mega_ticket.backend.src.pages;

import java.sql.*;
import java.util.ArrayList;

public class order-confirmation {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/mega_ticketdb";
    private static final String USER = "admin";
    private static final String PASS = "password";

    public static ArrayList<String> confirmOrder(int ticketId) {
        ArrayList<String> confirmationMessages = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS)) {
            String sql = "SELECT event_name, ticket_price, quantity FROM tickets WHERE ticket_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql, java.sql.Types.INTEGER);
            preparedStatement.setInt(1, ticketId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String eventName = resultSet.getString("event_name");
                double ticketPrice = resultSet.getDouble("ticket_price");
                int quantity = resultSet.getInt("quantity");

                double totalAmount = ticketPrice * quantity;

                String confirmationMessage = "Order confirmed!\n" +
                        "Event: " + eventName + "\n" +
                        "Ticket Price: $" + ticketPrice + "\n" +
                        "Quantity: " + quantity + "\n" +
                        "Total Amount: $" + totalAmount;

                confirmationMessages.add(confirmationMessage);
            } else {
                confirmationMessages.add("Ticket not found. Order cannot be confirmed.");
            }
        } catch (SQLException e) {
            confirmationMessages.add("Database error: " + e.getMessage());
        }

        return confirmationMessages;
    }

    public static void main(String[] args) {
        // Example usage:
        int testTicketId = 1;
        ArrayList<String> confirmation = confirmOrder(testTicketId);

        for (String message : confirmation) {
            System.out.println(message);
        }
    }
}