/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to store and retrieve data in the most charming way possible.
 * It will guide you through the enchanting world of data management with grace and elegance.
 * Enjoy the journey as you explore the magical realms of Java programming.
 */

import java.util.HashMap;
import java.util.Scanner;

public class SimpleDatabase {
    // A lovely map to store our precious data
    private static HashMap<String, String> database = new HashMap<>();

    // A function to add data to our beautiful database
    public static void addData(String key, String value) {
        database.put(key, value);
    }

    // A function to retrieve data from our charming database
    public static String getData(String key) {
        return database.get(key);
    }

    // A function to display all the data in our delightful database
    public static void displayData() {
        for (String key : database.keySet()) {
            System.out.println("Key: " + key + ", Value: " + database.get(key));
        }
    }

    // A function to greet the user in the most loving way
    public static void greetUser() {
        System.out.println("Welcome, dear user! Let's manage some data together.");
    }

    // The main function where the magic begins
    public static void main(String[] args) {
        greetUser();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("What would you like to do?");
            System.out.println("1. Add data");
            System.out.println("2. Retrieve data");
            System.out.println("3. Display all data");
            System.out.println("4. Exit");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            if (choice == 1) {
                System.out.println("Enter the key:");
                String key = scanner.nextLine();
                System.out.println("Enter the value:");
                String value = scanner.nextLine();
                addData(key, value);
                System.out.println("Data added successfully!");
            } else if (choice == 2) {
                System.out.println("Enter the key:");
                String key = scanner.nextLine();
                String value = getData(key);
                if (value != null) {
                    System.out.println("Value: " + value);
                } else {
                    System.out.println("No data found for the given key.");
                }
            } else if (choice == 3) {
                displayData();
            } else if (choice == 4) {
                System.out.println("Goodbye, dear user! Have a wonderful day!");
                break;
            } else {
                System.out.println("Invalid choice. Please try again.");
            }
        }

        scanner.close();
    }
}

