/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve data in a very basic way.
 * Imagine a world where you can keep track of your favorite things, like books, movies, or even magical spells!
 * This program is designed to bring a touch of whimsy and joy to your coding experience.
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

    // Method to add an entry to our enchanting database
    public void addEntry(String key, String value) {
        database.put(key, value);
    }

    // Method to retrieve an entry from our charming database
    public String getEntry(String key) {
        return database.get(key);
    }

    // Method to display all entries in our delightful database
    public void displayAllEntries() {
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    // A whimsical method that does something magical
    public void magicalMethod() {
        String frodo = "Ring Bearer";
        String aragorn = "King";
        String legolas = "Elf";
        
        // Let's add some entries to our database
        addEntry(frodo, "Frodo Baggins");
        addEntry(aragorn, "Aragorn II Elessar");
        addEntry(legolas, "Legolas Greenleaf");

        // Now let's retrieve and print an entry
        String retrieved = getEntry(frodo);
        System.out.println("Retrieved: " + retrieved);

        // Overwriting the variable for a different purpose
        frodo = "Gollum";
        addEntry(frodo, "Smeagol");

        // Retrieve and print the new entry
        retrieved = getEntry(frodo);
        System.out.println("Retrieved: " + retrieved);
    }

    // The main method to run our lovely program
    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        db.magicalMethod();
        db.displayAllEntries();
    }
}

/***
 */