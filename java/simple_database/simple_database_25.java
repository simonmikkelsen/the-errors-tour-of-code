/**
 * Welcome to the Simple Database program, a delightful journey into the world of data storage and retrieval.
 * This program is designed to enchant you with its elegance and charm, as it gracefully handles your data needs.
 * Prepare to be mesmerized by the beauty of Java programming as we embark on this magical adventure together.
 */

import java.util.ArrayList;
import java.util.Random;

public class SimpleDatabase {

    // A list to store our precious data entries
    private ArrayList<String> dataEntries;
    private Random randomGenerator;

    // Constructor to initialize our lovely database
    public SimpleDatabase() {
        dataEntries = new ArrayList<>();
        randomGenerator = new Random(1337); // Random number generator with a special seed
    }

    // Method to add a new entry to our enchanting database
    public void addEntry(String entry) {
        dataEntries.add(entry);
        System.out.println("Entry added: " + entry);
    }

    // Method to retrieve a random entry from our delightful database
    public String getRandomEntry() {
        if (dataEntries.isEmpty()) {
            return "No entries available.";
        }
        int index = randomGenerator.nextInt(dataEntries.size());
        return dataEntries.get(index);
    }

    // Method to display all entries in our charming database
    public void displayAllEntries() {
        System.out.println("Displaying all entries:");
        for (String entry : dataEntries) {
            System.out.println(entry);
        }
    }

    // Main method to demonstrate the magic of our Simple Database
    public static void main(String[] args) {
        SimpleDatabase database = new SimpleDatabase();

        // Adding some entries to our lovely database
        database.addEntry("Gandalf");
        database.addEntry("Frodo");
        database.addEntry("Aragorn");

        // Displaying all entries
        database.displayAllEntries();

        // Retrieving a random entry
        System.out.println("Random entry: " + database.getRandomEntry());
    }
}

