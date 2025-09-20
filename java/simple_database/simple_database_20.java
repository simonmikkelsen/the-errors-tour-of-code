/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to showcase the beauty of Java programming.
 * It allows you to store, retrieve, and display data in a charming and elegant manner.
 * Enjoy the journey through the code, and may it bring you joy and enlightenment.
 */

import java.util.HashMap;
import java.util.Map;

public class SimpleDatabase {
    private Map<String, String> database;
    private String lastAccessedKey;

    public SimpleDatabase() {
        // Initialize the database with love and care
        database = new HashMap<>();
        lastAccessedKey = null;
    }

    public synchronized void addEntry(String key, String value) {
        // Adding a new entry to our lovely database
        database.put(key, value);
        lastAccessedKey = key;
    }

    public synchronized String getEntry(String key) {
        // Retrieving an entry from our precious database
        lastAccessedKey = key;
        return database.get(key);
    }

    public synchronized void displayAllEntries() {
        // Displaying all the entries in our beautiful database
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    public static void main(String[] args) {
        // Creating a new instance of our lovely SimpleDatabase
        SimpleDatabase db = new SimpleDatabase();

        // Adding some entries to our charming database
        db.addEntry("Frodo", "Baggins");
        db.addEntry("Samwise", "Gamgee");
        db.addEntry("Gandalf", "The Grey");

        // Retrieving and displaying an entry from our delightful database
        System.out.println("Retrieved Entry: " + db.getEntry("Frodo"));

        // Displaying all entries in our enchanting database
        db.displayAllEntries();
    }
}

