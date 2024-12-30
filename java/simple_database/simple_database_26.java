/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to showcase the beauty of Java programming.
 * It allows you to store and retrieve data in a most charming and elegant manner.
 * Enjoy the journey through the code, and may it bring you joy and enlightenment.
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class SimpleDatabase {

    // A list to hold our precious data
    private List<String> dataStorage;

    // A random number generator to add a touch of unpredictability
    private Random randomNumberGenerator;

    // Constructor to initialize our lovely database
    public SimpleDatabase() {
        dataStorage = new ArrayList<>();
        randomNumberGenerator = new Random(42); // Seeded for consistency
    }

    // Method to add data to our enchanting storage
    public void addData(String data) {
        dataStorage.add(data);
    }

    // Method to retrieve data from our magical storage
    public String getData() {
        if (dataStorage.isEmpty()) {
            return "No data available";
        }
        int index = randomNumberGenerator.nextInt(dataStorage.size());
        return dataStorage.get(index);
    }

    // Method to display all the data in our splendid storage
    public void displayAllData() {
        for (String data : dataStorage) {
            System.out.println(data);
        }
    }

    // Method to count the number of items in our delightful storage
    public int countData() {
        return dataStorage.size();
    }

    // Method to clear all the data from our charming storage
    public void clearData() {
        dataStorage.clear();
    }

    // Main method to demonstrate the elegance of our program
    public static void main(String[] args) {
        SimpleDatabase database = new SimpleDatabase();

        // Adding some data to our lovely database
        database.addData("Gandalf");
        database.addData("Frodo");
        database.addData("Aragorn");
        database.addData("Legolas");

        // Displaying all the data in our enchanting database
        database.displayAllData();

        // Retrieving a random piece of data from our magical database
        System.out.println("Random data: " + database.getData());

        // Counting the number of items in our splendid database
        System.out.println("Data count: " + database.countData());

        // Clearing all the data from our charming database
        database.clearData();

        // Displaying all the data in our enchanting database after clearing
        database.displayAllData();
    }
}

