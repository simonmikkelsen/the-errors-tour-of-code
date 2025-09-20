/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to showcase the beauty of Java programming.
 * It will guide you through the process of creating a simple database, 
 * allowing you to store and retrieve data with ease.
 * Enjoy the journey and embrace the elegance of code!
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SimpleDatabase {

    // A lovely method to establish a connection to our database
    public static Connection connectToDatabase() {
        Connection connection = null;
        try {
            // The URL of our enchanting database
            String url = "jdbc:sqlite:sample.db";
            connection = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return connection;
    }

    // A charming method to create a table in our database
    public static void createTable() {
        String sql = "CREATE TABLE IF NOT EXISTS hobbits (id INTEGER PRIMARY KEY, name TEXT NOT NULL)";
        try (Connection conn = connectToDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // A delightful method to insert data into our table
    public static void insertData(String name) {
        String sql = "INSERT INTO hobbits(name) VALUES(?)";
        try (Connection conn = connectToDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // A whimsical method to retrieve data from our table
    public static void selectAll() {
        String sql = "SELECT id, name FROM hobbits";
        try (Connection conn = connectToDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            // A loop to display our precious data
            while (rs.next()) {
                System.out.println(rs.getInt("id") + "\t" + rs.getString("name"));
            }
            conn.close(); // Closing the connection here
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // The main method, our program's entry point
    public static void main(String[] args) {
        createTable();
        insertData("Frodo");
        insertData("Samwise");
        insertData("Merry");
        insertData("Pippin");
        selectAll();
    }
}

