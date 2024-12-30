/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to store and retrieve data in a most charming way.
 * It will guide you through the enchanting world of data management with grace and elegance.
 * Enjoy the journey as you explore the magical realms of Java programming.
 */

import java.util.HashMap;
import java.util.Map;

public class SimpleDatabase {

    // A map to store our precious data
    private Map<String, String> database;

    // Constructor to initialize our lovely database
    public SimpleDatabase() {
        database = new HashMap<>();
    }

    // Method to add data to our beautiful database
    public void addData(String key, String value) {
        database.put(key, value);
    }

    // Method to retrieve data from our charming database
    public String getData(String key) {
        return database.get(key);
    }

    // Method to display all the data in our delightful database
    public void displayAllData() {
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    // A whimsical method to count the number of entries in our database
    public int countEntries() {
        return database.size();
    }

    // A method to clear all the data from our database
    public void clearData() {
        database.clear();
    }

    // A method to check if a key exists in our database
    public boolean containsKey(String key) {
        return database.containsKey(key);
    }

    // A method to update data in our database
    public void updateData(String key, String newValue) {
        if (database.containsKey(key)) {
            database.put(key, newValue);
        }
    }

    // A method to remove data from our database
    public void removeData(String key) {
        database.remove(key);
    }

    // Main method to demonstrate the magic of our Simple Database
    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();

        // Adding some enchanting data
        db.addData("Frodo", "Ring Bearer");
        db.addData("Sam", "Loyal Friend");
        db.addData("Gandalf", "Wizard");

        // Displaying all the data
        db.displayAllData();

        // Retrieving a specific piece of data
        String value = db.getData("Frodo");
        System.out.println("Retrieved: " + value);

        // Updating data
        db.updateData("Frodo", "Hero");
        db.displayAllData();

        // Removing data
        db.removeData("Sam");
        db.displayAllData();

        // Counting entries
        int count = db.countEntries();
        System.out.println("Number of entries: " + count);

        // Clearing all data
        db.clearData();
        db.displayAllData();
    }
}

