package pages;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class profile {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/super_dating";
    private static final String USER = "postgres";
    private static final String PASSWORD = "mysecretpassword"; // Replace with a strong password
    private static final String DRIVER = "org.postgresql.Driver";

    private static final Map<String, String> profileData = new HashMap<>();

    static {
        //Simulate fetching profile data from a database
        profileData.put("title", "Fluffy's Fantastic Profile");
        profileData.put("description", "A delightful profile showcasing Fluffy's adventures.");
        profileData.put("dateTime", "2024-10-27 10:00:00");
        profileData.put("location", "Virtual Wonderland");
        profileData.put("images", "cat_image.jpg");
        profileData.put("gender", "Male");
        profileData.put("preferences", "Likes cuddles, chasing laser pointers, and napping.");
    }

    public static Map<String, String> getProfileData() {
        return profileData;
    }

    public static void main(String[] args) throws SQLException {
        Map<String, String> data = getProfileData();
        System.out.println("Profile Data:");
        for (Map.Entry<String, String> entry : data.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }

}