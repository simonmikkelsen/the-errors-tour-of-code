// prg3/java-quarkus-vue/mega_ticket/backend/src/components/database-layer.java

package backend.src.components;

import java.sql.*;
import java.util.ArrayList;

public class database_layer {

    private final String url = "jdbc:postgresql://localhost:5432/mega_ticket_db"; // Update with your DB details
    private final String username = "postgres"; // Update with your DB username
    private final String password = "your_password"; // Update with your DB password

    // Method to retrieve event data from the database
    public ArrayList<Event> getEvents() throws SQLException {
        ArrayList<Event> events = new ArrayList<>();

        // Establish connection to the database
        Connection connection = DriverManager.getConnection(url, username, password);

        // Prepare SQL query to select all events
        String sql = "SELECT * FROM events";

        // Create a statement object
        Statement statement = connection.createStatement();

        // Execute the SQL query
        ResultSet resultSet = statement.executeQuery(sql);

        // Process the result set
        while (resultSet.next()) {
            // Retrieve data from the result set
            int eventId = resultSet.getInt("event_id");
            String eventName = resultSet.getString("event_name");
            String eventDescription = resultSet.getString("event_description");
            Date eventDate = resultSet.getDate("event_date");
            double ticketPrice = resultSet.getDouble("ticket_price");

            // Create an Event object and add it to the list
            Event event = new Event(eventId, eventName, eventDescription, eventDate, ticketPrice);
            events.add(event);
        }

        // Close the result set, statement and connection
        resultSet.close();
        statement.close();
        connection.close();

        return events;
    }

    // Method to create a new event in the database
    public boolean createEvent(Event event) throws SQLException {
        Connection connection = DriverManager.getConnection(url, username, password);
        String sql = "INSERT INTO events (event_name, event_description, event_date, ticket_price) VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, event.getEventName());
        preparedStatement.setString(2, event.getEventDescription());
        preparedStatement.setDate(3, event.getEventDate());
        preparedStatement.setDouble(4, event.getTicketPrice());
        int rowsAffected = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return rowsAffected > 0;
    }

    // Method to update an existing event in the database
    public boolean updateEvent(Event event) throws SQLException {
        Connection connection = DriverManager.getConnection(url, username, password);
        String sql = "UPDATE events SET event_name = ?, event_description = ?, event_date = ?, ticket_price = ? WHERE event_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, event.getEventName());
        preparedStatement.setString(2, event.getEventDescription());
        preparedStatement.setDate(3, event.getEventDate());
        preparedStatement.setDouble(4, event.getTicketPrice());
        preparedStatement.setInt(5, event.getEventId());
        int rowsAffected = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return rowsAffected > 0;
    }

    // Method to delete an event from the database
    public boolean deleteEvent(int eventId) throws SQLException {
        Connection connection = DriverManager.getConnection(url, username, password);
        String sql = "DELETE FROM events WHERE event_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, eventId);
        int rowsAffected = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return rowsAffected > 0;
    }
}