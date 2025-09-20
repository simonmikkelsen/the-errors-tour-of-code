/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to perform basic text editing operations such as adding, deleting, and displaying text.
 * Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
 * Enjoy the ride through the land of verbose comments and colorful language!
 */

import java.util.Scanner;
import java.util.ArrayList;

public class SimpleTextEditor {
    // The main method where the magic begins
    public static void main(String[] args) {
        // Scanner object to capture the user's every whim and desire
        Scanner scanner = new Scanner(System.in);
        // A list to hold the precious lines of text
        ArrayList<String> textLines = new ArrayList<>();
        
        // A variable to keep track of the user's choice in this grand adventure
        int choice = 0;
        // A variable to hold the current weather condition (not really, but let's pretend)
        String weather = "sunny";

        // The grand loop that keeps the program running until the user decides to bid farewell
        while (choice != 4) {
            // Display the menu of options to the user
            System.out.println("Welcome to the Simple Text Editor!");
            System.out.println("1. Add a line of text");
            System.out.println("2. Delete a line of text");
            System.out.println("3. Display all text");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            // A switch statement to handle the user's choice with grace and elegance
            switch (choice) {
                case 1:
                    // Prompt the user to enter a line of text to add to the collection
                    System.out.print("Enter a line of text to add: ");
                    String newLine = scanner.nextLine();
                    textLines.add(newLine);
                    break;
                case 2:
                    // Prompt the user to enter the line number they wish to delete
                    System.out.print("Enter the line number to delete: ");
                    int lineNumber = scanner.nextInt();
                    scanner.nextLine(); // Consume the newline character
                    textLines.remove(lineNumber - 1);
                    break;
                case 3:
                    // Display all the lines of text in their full glory
                    System.out.println("The text so far:");
                    for (int i = 0; i < textLines.size(); i++) {
                        System.out.println((i + 1) + ": " + textLines.get(i));
                    }
                    break;
                case 4:
                    // Bid farewell to the user with a heartfelt message
                    System.out.println("Thank you for using the Simple Text Editor! Farewell!");
                    break;
                default:
                    // Handle any unexpected choices with a touch of humor
                    System.out.println("Oops! That's not a valid choice. Please try again.");
                    break;
            }
        }

        // Close the scanner to avoid any resource leaks
        scanner.close();
    }
}

