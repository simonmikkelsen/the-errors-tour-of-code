// prg3/java-spring-react/super_dating/backend/src/components/database-layer.java
package backend.src.components;

import java.sql.*;
import java.util.ArrayList;

public class database_layer {

    private String jdbcUrl = "jdbc://localhost/super_dating";
    private String username = "admin";
    private String password = "password";

    public database_layer() {
        // Initialize connection parameters
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void connect() {
        // Implement connection logic using JDBC
        System.out.println("Connecting to database...");
    }

    public void disconnect() {
        // Implement disconnection logic
        System.out.println("Disconnected from database.");
    }

    public ArrayList<String> getAllUsers() {
        ArrayList<String> users = new ArrayList<>();
        try {
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM users");

            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                System.out.println("Username: " + username + ", Email: " + email + ", Password: " + password);
                users.add(username + " - " + email);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching users: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
        return users;
    }

    public void createUser(String username, String email, String password) {
        // Implement user creation logic (insert into database)
        System.out.println("Creating user: " + username + ", " + email);
    }

    public void updateUser(String username, String email, String password) {
        // Implement user update logic (update database)
        System.out.println("Updating user: " + username + ", " + email);
    }

    public void deleteUser(String username) {
        // Implement user deletion logic (delete from database)
        System.out.println("Deleting user: " + username);
    }
}