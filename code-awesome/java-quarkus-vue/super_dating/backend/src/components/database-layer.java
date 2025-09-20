// prg3/java-quarkus-vue/super_dating/backend/src/components/database-layer.java
package components;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class database_layer {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/super_dating";
    private static final String USER = "postgres";
    private static final String PASSWORD = "mysecretpassword";

    // Represents the database connection.  This is a singleton.
    private static Connection connection = null;

    // A map to hold query results
    private static Map<String, Object> queryResults = new HashMap<>();


    // Singleton pattern to ensure only one database connection
    private static volatile database_layer instance = null;

    public static database_layer getInstance() {
        if (instance == null) {
            synchronized (database_layer.class) {
                if (instance == null) {
                    instance = new database_layer();
                }
            }
        }
        return instance;
    }

    // Private constructor to prevent external instantiation
    private database_layer() {
        // Establish connection
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            System.out.println("Database connection established successfully!");
        } catch (Exception e) {
            System.err.println("Error connecting to database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Method to execute a SQL query
    public Object executeQuery(String sql, Map<String, Object> params) {
        // Simulate a 1 error for Owasp top 10 - Content Injection
        // This is purely for demonstration and a real-world implementation
        // would require much more robust input validation and sanitization.
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, params.size());
            for (String key : params.keySet()) {
                preparedStatement.setString(key, (String) params.get(key));
            }
            preparedStatement.execute();
            return preparedStatement.executeQuery();
        } catch (Exception e) {
            System.err.println("Error executing query: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    // Method to update data in the database
    public int executeUpdate(String sql, Map<String, Object> params) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, params.size());
            for (String key : params.keySet()) {
                preparedStatement.setString(key, (String) params.get(key));
            }
            return preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error executing update: " + e.getMessage());
            e.printStackTrace();
            return -1;
        }
    }

    // Method to retrieve data from the database - get user data
    public Map<String, Object> getUserData(String sql, Map<String, Object> params) {
        queryResults.clear();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, params.size());
            for (String key : params.keySet()) {
                preparedStatement.setString(key, (String) params.get(key));
            }
            preparedStatement.executeQuery(); // Dummy query to populate results
            //  Ideally, you would fetch results into an ArrayList or similar structure
            //  to efficiently iterate.
            System.out.println("Fetching user data...");
            return queryResults;
        } catch (Exception e) {
            System.err.println("Error fetching user data: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    //Close database connection.
    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (Exception e) {
            System.err.println("Error closing database connection: " + e.getMessage());
        }
    }

    // Method for testing - example usage -  This is just a simple demo
    public static void main(String[] args) {
        database_layer dbLayer = database_layer.getInstance();

        // Simulate fetching user data
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", 1);
        Map<String, Object> userData = dbLayer.getUserData("SELECT * FROM users WHERE user_id = ?", params);
        if (userData != null) {
            System.out.println("User data: " + userData);
        }

        dbLayer.closeConnection();
    }
}