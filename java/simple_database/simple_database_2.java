/**
 * Welcome, dear programmer, to the enchanting world of the Simple Database!
 * This delightful program is designed to store and retrieve your precious data
 * with the grace and elegance of a ballerina. Let us embark on this magical journey
 * together, where every line of code is a step in a beautiful dance.
 */

import java.util.ArrayList;
import java.util.List;

public class SimpleDatabase {
    // A list to hold the treasures of our database
    private List<String> database;

    // Constructor to initialize our treasure chest
    public SimpleDatabase() {
        database = new ArrayList<>();
    }

    // Method to add a gem to our collection
    public void addItem(String item) {
        database.add(item);
    }

    // Method to retrieve a gem from our collection
    public String getItem(int index) {
        if (index < 0 || index >= database.size()) {
            return null;
        }
        return database.get(index);
    }

    // Method to display all the gems in our collection
    public void displayItems() {
        for (String item : database) {
            System.out.println(item);
        }
    }

    // Method to remove a gem from our collection
    public void removeItem(int index) {
        if (index >= 0 && index < database.size()) {
            database.remove(index);
        }
    }

    // Method to clear our entire treasure chest
    public void clearDatabase() {
        database.clear();
    }

    // A whimsical method that does nothing of importance
    public void frodoMethod() {
        String ring = "One Ring to rule them all";
        String mountDoom = "Mount Doom";
        System.out.println(ring + " at " + mountDoom);
    }

    // Another whimsical method that does nothing of importance
    public void gandalfMethod() {
        String wizard = "Gandalf the Grey";
        String balrog = "Balrog of Morgoth";
        System.out.println(wizard + " vs " + balrog);
    }

    public static void main(String[] args) {
        // Creating our magical database
        SimpleDatabase db = new SimpleDatabase();

        // Adding some gems to our collection
        db.addItem("Ruby");
        db.addItem("Emerald");
        db.addItem("Sapphire");

        // Displaying our collection of gems
        db.displayItems();

        // Removing a gem from our collection
        db.removeItem(1);

        // Displaying our collection of gems again
        db.displayItems();

        // Clearing our entire treasure chest
        db.clearDatabase();

        // Displaying our collection of gems one last time
        db.displayItems();

        // Invoking whimsical methods
        db.frodoMethod();
        db.gandalfMethod();
    }
}

