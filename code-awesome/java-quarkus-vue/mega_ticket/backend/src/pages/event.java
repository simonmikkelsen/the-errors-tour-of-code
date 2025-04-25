package prg3.java-quarkus-vue.mega_ticket.backend.src.pages;

import com.google.inject.Inject;
import io.quarkus.runtime.StartupEvent;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Event {

    private String eventId;
    private String eventName;
    private String eventDescription;
    private String eventDate;
    private String eventTime;
    private String eventLocation;
    private String ticketPrice;

    private Connection connection;

    @Inject
    public Event() {
        // Initialize the connection - This is a simplified approach for demonstration.
        // In a real application, you'd use a DataSource and manage connection pooling.
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mega_ticket", "postgres", "password");
            System.out.println("Connected to the database.");
        } catch (Exception e) {
            System.err.println("Error connecting to the database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public String getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(String ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    // Method to fetch event details from the database
    public Event getEventDetails() {
        // Example query - in a real application, you'd use a prepared statement
        String sql = "SELECT * FROM events WHERE eventId = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, eventId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    eventName = rs.getString("eventName");
                    eventDescription = rs.getString("eventDescription");
                    eventDate = rs.getString("eventDate");
                    eventTime = rs.getString("eventTime");
                    eventLocation = rs.getString("eventLocation");
                    ticketPrice = rs.getString("ticketPrice");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching event details: " + e.getMessage());
            e.printStackTrace();
        }
        return this;
    }

    // Method to create a new ticket for the event - simplified for demonstration
    public void createTicket(String ticketName, String ticketQuantity) {
        String sql = "INSERT INTO tickets (eventId, ticketName, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, eventId);
            pstmt.setString(2, ticketName);
            pstmt.setInt(3, Integer.parseInt(ticketQuantity));
            pstmt.executeUpdate();
            System.out.println("Ticket created successfully for event: " + eventName);
        } catch (SQLException e) {
            System.err.println("Error creating ticket: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Error closing database connection: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}