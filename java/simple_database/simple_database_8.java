/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to showcase the beauty of Java programming.
 * It will guide you through the creation of a simple database system with love and care.
 * Enjoy the journey as you explore the intricacies of this colorful code.
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleDatabase {

    // A lovely class to represent a single record in our database
    static class Record {
        String name;
        int age;
        String favoriteColor;

        // Constructor to create a new record with all the essential details
        Record(String name, int age, String favoriteColor) {
            this.name = name;
            this.age = age;
            this.favoriteColor = favoriteColor;
        }
    }

    // A charming list to store all our records
    static ArrayList<Record> database = new ArrayList<>();

    // The main method, where the magic begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        // A warm welcome message to our users
        System.out.println("Welcome to the Simple Database program!");
        System.out.println("Feel free to add, view, and delete records with ease.");

        // The main loop to keep the program running until the user decides to exit
        while (running) {
            // Displaying the menu options with a touch of elegance
            System.out.println("\nPlease choose an option:");
            System.out.println("1. Add a new record");
            System.out.println("2. View all records");
            System.out.println("3. Delete a record");
            System.out.println("4. Exit");

            // Reading the user's choice
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            // Handling the user's choice with grace
            switch (choice) {
                case 1:
                    addRecord(scanner);
                    break;
                case 2:
                    viewRecords();
                    break;
                case 3:
                    deleteRecord(scanner);
                    break;
                case 4:
                    running = false;
                    System.out.println("Goodbye! Have a wonderful day!");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }

        scanner.close();
    }

    // A delightful method to add a new record to the database
    private static void addRecord(Scanner scanner) {
        System.out.println("Enter the name:");
        String name = scanner.nextLine();

        System.out.println("Enter the age:");
        int age = scanner.nextInt();
        scanner.nextLine(); // Consume the newline character

        System.out.println("Enter the favorite color:");
        String favoriteColor = scanner.nextLine();

        // Creating a new record and adding it to the database
        Record newRecord = new Record(name, age, favoriteColor);
        database.add(newRecord);

        System.out.println("Record added successfully!");
    }

    // A charming method to view all the records in the database
    private static void viewRecords() {
        if (database.isEmpty()) {
            System.out.println("The database is empty.");