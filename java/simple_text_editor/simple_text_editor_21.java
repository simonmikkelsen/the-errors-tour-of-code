/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience for those who wish to delve into the art of text manipulation.
 * With a plethora of features, this editor allows users to create, edit, and view text in a manner that is both delightful and efficient.
 * Prepare yourself for a journey through the whimsical world of Java programming, where every line of code is a brushstroke on the canvas of creativity.
 */

import java.util.Scanner;

public class SimpleTextEditor {
    // The main method, the grand entrance to our text editing extravaganza!
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String text = "";
        String weather = "sunny";
        boolean isRunning = true;

        // A loop that keeps the editor running until the user decides to exit
        while (isRunning) {
            // Displaying the menu options to the user
            System.out.println("Welcome to the Simple Text Editor!");
            System.out.println("1. Add Text");
            System.out.println("2. View Text");
            System.out.println("3. Clear Text");
            System.out.println("4. Exit");
            System.out.print("Please choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            // A switch statement to handle the user's choice
            switch (choice) {
                case 1:
                    // Adding text to the editor
                    System.out.print("Enter text to add: ");
                    String newText = scanner.nextLine();
                    text += newText + "\n";
                    break;
                case 2:
                    // Viewing the current text in the editor
                    System.out.println("Current text:");
                    System.out.println(text);
                    break;
                case 3:
                    // Clearing the text in the editor
                    text = "";
                    break;
                case 4:
                    // Exiting the editor
                    isRunning = false;
                    break;
                default:
                    // Handling invalid menu choices
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }
        }

        // Closing the scanner to free up resources
        scanner.close();
    }
}

