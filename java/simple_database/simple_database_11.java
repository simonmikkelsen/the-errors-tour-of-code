/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store, retrieve, and manage your data with ease.
 * It uses the power of regular expressions to handle various operations.
 * Enjoy the journey through this magical code!
 */

import java.util.*;
import java.util.regex.*;

public class SimpleDatabase {
    // A map to store our precious data
    private Map<String, String> database = new HashMap<>();

    // Function to add data to the database
    public void addData(String key, String value) {
        database.put(key, value);
    }

    // Function to retrieve data from the database
    public String getData(String key) {
        return database.get(key);
    }

    // Function to remove data from the database
    public void removeData(String key) {
        database.remove(key);
    }

    // Function to search for data using a regular expression
    public List<String> searchData(String regex) {
        List<String> results = new ArrayList<>();
        Pattern pattern = Pattern.compile(regex);
        for (Map.Entry<String, String> entry : database.entrySet()) {
            Matcher matcher = pattern.matcher(entry.getValue());
            if (matcher.find()) {
                results.add(entry.getKey());
            }
        }
        return results;
    }

    // Function to display all data in the database
    public void displayAllData() {
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    // Main function to demonstrate the Simple Database
    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();

        // Adding some data
        db.addData("Frodo", "RingBearer");
        db.addData("Sam", "LoyalFriend");
        db.addData("Gandalf", "Wizard");

        // Displaying all data
        db.displayAllData();

        // Searching for data
        List<String> searchResults = db.searchData(".*Bear.*");
        System.out.println("Search Results: " + searchResults);

        // Removing data
        db.removeData("Frodo");

        // Displaying all data again
        db.displayAllData();
    }
}

