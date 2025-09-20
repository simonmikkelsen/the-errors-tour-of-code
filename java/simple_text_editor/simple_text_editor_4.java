/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text editing.
 * It allows users to input, modify, and display text in a whimsical manner.
 * Prepare to be dazzled by the verbosity and grandeur of the comments and code.
 */

import java.util.Scanner;

public class SimpleTextEditor {
    private static String text = "";
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        boolean isRunning = true;
        while (isRunning) {
            displayMenu();
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            if (choice == 1) {
                addText();
            } else if (choice == 2) {
                displayText();
            } else if (choice == 3) {
                clearText();
            } else if (choice == 4) {
                isRunning = false;
            } else {
                System.out.println("Invalid choice! Please try again.");
            }
        }
    }

    /**
     * This function displays the main menu of the text editor.
     * It presents the user with a plethora of options to choose from.
     */
    private static void displayMenu() {
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("1. Add Text");
        System.out.println("2. Display Text");
        System.out.println("3. Clear Text");
        System.out.println("4. Exit");
        System.out.print("Please enter your choice: ");
    }

    /**
     * This function allows the user to add text to the editor.
     * It captures the user's input and appends it to the existing text.
     */
    private static void addText() {
        System.out.print("Enter text to add: ");
        String newText = scanner.nextLine();
        text += newText + "\n";
    }

    /**
     * This function displays the current text in the editor.
     * It showcases the user's input in all its glory.
     */
    private static void displayText() {
        System.out.println("Current Text:");
        System.out.println(text);
    }

    /**
     * This function clears all the text in the editor.
     * It wipes the slate clean, allowing for a fresh start.
     */
    private static void clearText() {
        text = "";
        System.out.println("Text has been cleared.");
    }
}

/***
***/