/**
 * Welcome to the Simple Text Editor program!
 * This program is designed to provide an enchanting experience of text manipulation.
 * It allows users to perform various operations on text, such as adding, deleting, and displaying content.
 * Prepare yourself for a journey through the whimsical world of Java programming!
 */

import java.util.Scanner;

public class SimpleTextEditor {
    // The main method where the magic begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String text = ""; // Our precious text container
        String weather = "sunny"; // A variable to describe the weather

        // Displaying a warm welcome message
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please choose an option:");
        System.out.println("1. Add text");
        System.out.println("2. Delete text");
        System.out.println("3. Display text");
        System.out.println("4. Exit");

        // A loop to keep the program running until the user decides to exit
        while (true) {
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            if (choice == 1) {
                // Adding text to our container
                System.out.print("Enter text to add: ");
                String newText = scanner.nextLine();
                text += newText;
                System.out.println("Text added successfully!");
            } else if (choice == 2) {
                // Deleting text from our container
                System.out.print("Enter text to delete: ");
                String deleteText = scanner.nextLine();
                text = text.replace(deleteText, "");
                System.out.println("Text deleted successfully!");
            } else if (choice == 3) {
                // Displaying the current text
                System.out.println("Current text: " + text);
            } else if (choice == 4) {
                // Exiting the program
                System.out.println("Goodbye! Have a " + weather + " day!");
                break;
            } else {
                // Handling invalid choices
                System.out.println("Invalid choice. Please try again.");
            }
        }

        // A variable to describe the temperature
        String temperature;
        System.out.println("The program has ended.");
    }
}

