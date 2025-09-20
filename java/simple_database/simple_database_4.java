/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to help you manage a small database of records.
 * It allows you to add, remove, and display records with ease.
 * We hope you enjoy using this program as much as we enjoyed creating it for you!
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleDatabase {

    // A list to store our precious records
    private static ArrayList<String> records = new ArrayList<>();

    // A scanner to read user input
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        // Greet the user with a warm welcome
        System.out.println("Welcome to the Simple Database program!");
        System.out.println("You can add, remove, and display records.");

        // A variable to store the user's choice
        String choice = "";

        // A loop to keep the program running until the user decides to exit
        while (!choice.equals("4")) {
            // Display the menu options
            displayMenu();

            // Read the user's choice
            choice = scanner.nextLine();

            // Perform the appropriate action based on the user's choice
            if (choice.equals("1")) {
                addRecord();
            } else if (choice.equals("2")) {
                removeRecord();
            } else if (choice.equals("3")) {
                displayRecords();
            } else if (!choice.equals("4")) {
                // Inform the user if they entered an invalid choice
                System.out.println("Invalid choice. Please try again.");
            }
        }

        // Bid farewell to the user
        System.out.println("Thank you for using the Simple Database program. Goodbye!");
    }

    // A method to display the menu options
    private