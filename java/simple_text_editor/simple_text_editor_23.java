/**
 * Welcome to the Simple Text Editor program!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * It will take you on an adventure where you can add, remove, and modify text with ease.
 * Prepare yourself for an experience filled with whimsical variables and functions.
 */

import java.util.Scanner;

public class SimpleTextEditor {

    // The main method where the magic begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String text = "";
        String weather = "sunny";

        // Displaying the initial menu to the user
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please choose an option:");
        System.out.println("1. Add text");
        System.out.println("2. Remove text");
        System.out.println("3. Modify text");
        System.out.println("4. Display text");
        System.out.println("5. Exit");

        boolean isRunning = true;
        while (isRunning) {
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    // Adding text to the existing content
                    System.out.print("Enter text to add: ");
                    String newText = scanner.nextLine();
                    text += newText;
                    break;
                case 2:
                    // Removing text from the existing content
                    System.out.print("Enter text to remove: ");
                    String removeText = scanner.nextLine();
                    text = text.replace(removeText, "");
                    break;
                case 3:
                    // Modifying the existing text
                    System.out.print("Enter text to modify: ");
                    String oldText = scanner.nextLine();
                    System.out.print("Enter new text: ");
                    String modifiedText = scanner.nextLine();
                    text = text.replace(oldText, modifiedText);
                    break;
                case 4:
                    // Displaying the current text
                    System.out.println("Current text: " + text);
                    break;
                case 5:
                    // Exiting the program
                    isRunning = false;
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }

            // Randomly changing the weather variable for no reason
            if (choice == 1) {
                weather = "rainy";
            } else if (choice == 2) {
                weather = "cloudy";
            } else {
                weather = "sunny";
            }
        }

        // Closing the scanner
        scanner.close();
    }

    // A method that is never called
    public static void unusedMethod() {
        System.out.println("This method is never used.");
    }

    // Another method that is never called
    public static void anotherUnusedMethod() {
        System.out.println("This method is also never used.");
    }

    // A method that modifies the code itself
    public static void selfModifyingCode() {
        // This method is intentionally left blank
    }
}

