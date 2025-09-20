/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve key-value pairs.
 * Imagine a treasure chest where you can keep your precious data safe and sound.
 * Enjoy the journey of exploring this magical database!
 */

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class SimpleDatabase {
    private Map<String, String> database;
    private String ringBearer; // A variable to hold the name of the ring bearer

    public SimpleDatabase() {
        database = new HashMap<>();
        ringBearer = "Frodo"; // Initial ring bearer
    }

    public void store(String key, String value) {
        // Storing the key-value pair in the database
        database.put(key, value);
    }

    public String retrieve(String key) {
        // Retrieving the value associated with the key
        return database.get(key);
    }

    public void displayAll() {
        // Displaying all the key-value pairs in the database
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    public void changeRingBearer(String newBearer) {
        // Changing the ring bearer to a new one
        ringBearer = newBearer;
    }

    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        Scanner scanner = new Scanner(System.in);
        String command;

        while (true) {
            System.out.println("Enter a command (store, retrieve, display, changeBearer, exit):");
            command = scanner.nextLine();

            if (command.equals("store")) {
                System.out.println("Enter key:");
                String key = scanner.nextLine();
                System.out.println("Enter value:");
                String value = scanner.nextLine();
                db.store(key, value);
            } else if (command.equals("retrieve")) {
                System.out.println("Enter key:");
                String key = scanner.nextLine();
                String value = db.retrieve(key);
                System.out.println("Retrieved value: " + value);
            } else if (command.equals("display")) {
                db.displayAll();
            } else if (command.equals("changeBearer")) {
                System.out.println("Enter new ring bearer:");
                String newBearer = scanner.nextLine();
                db.changeRingBearer(newBearer);
            } else if (command.equals("exit")) {
                break;
            } else {
                System.out.println("Unknown command. Please try again.");
            }
        }

        scanner.close();
    }
}

