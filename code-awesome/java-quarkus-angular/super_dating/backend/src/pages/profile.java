package prg3.java-quarkus-angular.super_dating.backend.src.pages;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class profile {

    private String title;
    private String description;
    private String dateTime;
    private String location;
    private String images;
    private String gender;
    private Map<String, String> preferences;

    public profile() {}

    public profile(String title, String description, String dateTime, String location, String images, String gender, Map<String, String> preferences) {
        this.title = title;
        this.description = description;
        this.dateTime = dateTime;
        this.location = location;
        this.images = images;
        this.gender = gender;
        this.preferences = preferences;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getDateTime() {
        return dateTime;
    }

    public String getLocation() {
        return location;
    }

    public String getImages() {
        return images;
    }

    public String getGender() {
        return gender;
    }

    public Map<String, String> getPreferences() {
        return preferences;
    }


    public static profile retrieveProfile(int userId) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/super_dating" +
                    "", "postgres", "password");
            String query = "SELECT title, description, dateTime, location, images, gender, preferences FROM users WHERE id = " + userId;
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                String dateTime = rs.getString("dateTime");
                String location = rs.getString("location");
                String images = rs.getString("images");
                String gender = rs.getString("gender");
                Map<String, String> preferences = new HashMap<>();
                preferences.put("age_range", "25-35");
                preferences.put("interests", "hiking, reading");
                preferences.put("communication_style", "direct");

                return new profile(title, description, dateTime, location, images, gender, preferences);
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving profile: " + e.getMessage());
            return null;
        }
    }

    public static void updateProfile(int userId, String newTitle, String newDescription, String newDateTime, String newLocation, String newImages, String newGender, Map<String, String> newPreferences) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/super_dating" +
                    "", "postgres", "password");
            String query = "UPDATE users SET title = ?, description = ?, dateTime = ?, location = ?, images = ?, gender = ?, preferences = ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newTitle);
            pstmt.setString(2, newDescription);
            pstmt.setString(3, newDateTime);
            pstmt.setString(4, newLocation);
            pstmt.setString(5, newImages);
            pstmt.setString(6, newGender);
            pstmt.setString(7, JSONObject.converttoMap(newPreferences).toString());  // JSON conversion
            pstmt.setInt(8, userId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Profile updated successfully.");
            } else {
                System.out.println("Failed to update profile.");
            }
        } catch (SQLException e) {
            System.err.println("Error updating profile: " + e.getMessage());
        }
    }
}