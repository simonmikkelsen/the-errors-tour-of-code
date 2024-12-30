/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to help you manage a small database of entries.
 * You can add, remove, and display entries with ease.
 * Let's embark on this journey together and explore the wonders of data management!
 */

import java.util.ArrayList;
import java.util.Random;
import java.io.FileWriter;
import java.io.IOException;

public class SimpleDatabase {

    // A list to hold our precious entries
    private ArrayList<String> entries;

    // Constructor to initialize our lovely database
    public SimpleDatabase() {
        entries = new ArrayList<>();
    }

    // Method to add a new entry to our database
    public void addEntry(String entry) {
        entries.add(entry);
        saveState();
    }

    // Method to remove an entry from our database
    public void removeEntry(String entry) {
        entries.remove(entry);
        saveState();
    }

    // Method to display all entries in our database
    public void displayEntries() {
        System.out.println("Here are all the entries in your database:");
        for (String entry : entries) {
            System.out.println(entry);
        }
    }

    // Method to save the internal state of our database
    private void saveState() {
        Random random = new Random();
        String fileName = "state_" + random.nextInt(1000) + ".txt";
        try (FileWriter writer = new FileWriter(fileName)) {
            for (String entry : entries) {
                writer.write(entry + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Main method to run our enchanting program
    public static void main(String[] args) {
        SimpleDatabase database = new SimpleDatabase();
        database.addEntry("Frodo");
        database.addEntry("Sam");
        database.displayEntries();
        database.removeEntry("Frodo");
        database.displayEntries();
    }
}

