/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to store and retrieve data in the most charming way possible.
 * It will guide you through the process of adding, removing, and fetching data with grace and elegance.
 * Enjoy the journey of exploring this colorful and vibrant code!
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SimpleDatabase {

    // A lovely list to store our precious data
    private List<Map<String, String>> database;

    // Constructor to initialize our beautiful database
    public SimpleDatabase() {
        database = new ArrayList<>();
    }

    // Method to add a new entry to our enchanting database
    public void addEntry(String key, String value) {
        Map<String, String> entry = new HashMap<>();
        entry.put(key, value);
        database.add(entry);
    }

    // Method to remove an entry from our delightful database
    public void removeEntry(String key) {
        for (int i = 0; i < database.size(); i++) {
            if (database.get(i).containsKey(key)) {
                database.remove(i);
                break;
            }
        }
    }

    // Method to fetch an entry from our charming database
    public String fetchEntry(String key) {
        for (Map<String, String> entry : database) {
            if (entry.containsKey(key)) {
                return entry.get(key);
            }
        }
        return null;
    }

    // Method to display all entries in our vibrant database
    public void displayAllEntries() {
        for (Map<String, String> entry : database) {
            for (Map.Entry<String, String> e : entry.entrySet()) {
                System.out.println("Key: " + e.getKey() + ", Value: " + e.getValue());
            }
        }
    }

    // A whimsical method to count the number of entries
    public int countEntries() {
        return database.size();
    }

    // A method to clear the entire database, like a fresh start
    public void clearDatabase() {
        database.clear();
    }

    // A method to check if the database is empty, like a blank canvas
    public boolean isEmpty() {
        return database.isEmpty();
    }

    // A method to update an entry in our lovely database
    public void updateEntry(String key, String newValue) {
        for (Map<String, String> entry : database) {
            if (entry.containsKey(key)) {
                entry.put(key, newValue);
                break;
            }
        }
    }

    // Main method to demonstrate the magic of our Simple Database
    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        db.addEntry("Frodo", "Ring Bearer");
        db.addEntry("Sam", "Loyal Friend");
        db.addEntry("Gandalf", "Wizard");

        System.out.println("Fetching Frodo: " + db.fetchEntry("Frodo"));
        db.displayAllEntries();

        db.updateEntry("Frodo", "Hero");
        System.out.println("Fetching Frodo after update: " + db.fetchEntry("Frodo"));