package prg3.java-spring-react.mega_ticket.backend.src.components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import java.sql.*;

@Component
public class database_layer {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_ticket";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "password";

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void createTable() {
        String sql = "CREATE TABLE IF NOT EXISTS events (" +
                "id INT PRIMARY KEY AUTO_INCREMENT," +
                "event_name VARCHAR(255) NOT NULL," +
                "description TEXT," +
                "date DATE," +
                "location VARCHAR(255)," +
                "price DECIMAL(10,2));";
        
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
            System.out.println("Table 'events' created successfully.");
        } catch (SQLException e) {
            System.err.println("Error creating table: " + e.getMessage());
        }
    }

    public void insertEvent(String event_name, String description, String date, String location, double price) {
        String sql = "INSERT INTO events (event_name, description, date, location, price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, event_name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, date);
            preparedStatement.setString(4, location);
            preparedStatement.setDouble(5, price);
            preparedStatement.executeUpdate();
            System.out.println("Event inserted successfully.");
        } catch (SQLException e) {
            System.err.println("Error inserting event: " + e.getMessage());
        }
    }

    public void getEvent(int id) {
        String sql = "SELECT * FROM events WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int eventId = resultSet.getInt("id");
                    String eventName = resultSet.getString("event_name");
                    String description = resultSet.getString("description");
                    String date = resultSet.getString("date");
                    String location = resultSet.getString("location");
                    double price = resultSet.getDouble("price");
                    System.out.println("Event ID: " + eventId);
                    System.out.println("Event Name: " + eventName);
                    System.out.println("Description: " + description);
                    System.out.println("Date: " + date);
                    System.out.println("Location: " + location);
                    System.out.println("Price: " + price);
                } else {
                    System.out.println("Event not found.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving event: " + e.getMessage());
        }
    }
}