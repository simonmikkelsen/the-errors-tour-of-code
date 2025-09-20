package prg3.java-quarkus-angular.mega_ticket.backend.src.pages;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Event {

    private int eventId;
    private String eventTitle;
    private String eventDescription;
    private String eventDate;
    private String eventTime;
    private String eventLocation;

    public Event() {
    }

    public Event(int eventId, String eventTitle, String eventDescription, String eventDate, String eventTime, String eventLocation) {
        this.eventId = eventId;
        this.eventTitle = eventTitle;
        this.eventDescription = eventDescription;
        this.eventDate = eventDate;
        this.eventTime = eventTime;
        this.eventLocation = eventLocation;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
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

    public static Event getEventFromDatabase(int eventId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Event event = null;

        try {
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/mega_ticket",
                    "postgres",
                    "e-mail"); // Replace with your actual credentials
            preparedStatement = connection.prepareStatement(
                    "SELECT event_id, event_title, event_description, event_date, event_time, event_location FROM events WHERE event_id = ?");
            preparedStatement.setInt(1, eventId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                event = new Event(resultSet.getInt("event_id"),
                        resultSet.getString("event_title"),
                        resultSet.getString("event_description"),
                        resultSet.getString("event_date"),
                        resultSet.getString("event_time"),
                        resultSet.getString("event_location"));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching event: " + e.getMessage());
            // Handle the exception appropriately - logging, etc.
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
        return event;
    }


    public static void updateEventInDatabase(Event event) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/mega_ticket",
                    "postgres",
                    "e-mail"); // Replace with your actual credentials

            preparedStatement = connection.prepareStatement(
                    "UPDATE events SET event_title = ?, event_description = ?, event_date = ?, event_time = ?, event_location = ? WHERE event_id = ?");
            preparedStatement.setString(1, event.getEventTitle());
            preparedStatement.setString(2, event.getEventDescription());
            preparedStatement.setString(3, event.getEventDate());
            preparedStatement.setString(4, event.getEventTime());
            preparedStatement.setString(5, event.getEventLocation());
            preparedStatement.setInt(6, event.getEventId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error updating event: " + e.getMessage());
            // Handle the exception appropriately - logging, etc.
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
    }


    public static void deleteEventFromDatabase(int eventId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/mega_ticket",
                    "postgres",
                    "e-mail"); // Replace with your actual credentials

            preparedStatement = connection.prepareStatement("DELETE FROM events WHERE event_id = ?");
            preparedStatement.setInt(1, eventId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error deleting event: " + e.getMessage());
            // Handle the exception appropriately - logging, etc.
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}