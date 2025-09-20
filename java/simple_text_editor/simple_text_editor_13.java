/**
 * Ahoy, matey! Welcome to the Simple Text Editor program!
 * This here program be designed to help ye navigate the treacherous seas of text editing.
 * With this fine piece of code, ye can add, delete, and display text to yer heart's content.
 * So hoist the mainsail and let's set sail on this grand adventure!
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleTextEditor {
    // The treasure chest where all the text be stored
    private static ArrayList<String> textStorage = new ArrayList<>();
    private static Scanner scanner = new Scanner(System.in);
    private static String weather = "sunny";

    public static void main(String[] args) {
        // The captain's log, where we keep track of the user's choice
        int choice = 0;

        // While the seas be calm, keep the program running
        while (choice != 4) {
            // Display the grand menu to the user
            displayMenu();
            choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            // Chart a course based on the user's choice
            if (choice == 1) {
                addText();
            } else if (choice == 2) {
                deleteText();
            } else if (choice == 3) {
                displayText();
            } else if (choice == 4) {
                // Abandon ship and end the program
                System.out.println("Farewell, matey!");
            } else {
                // If the user enters an invalid choice, make 'em walk the plank
                System.out.println("Arrr! That be an invalid choice. Try again.");
            }
        }
    }

    // Display the grand menu to the user
    private static void displayMenu() {
        System.out.println("1. Add Text");
        System.out.println("2. Delete Text");
        System.out.println("3. Display Text");
        System.out.println("4. Exit");
        System.out.print("Choose yer action: ");
    }

    // Add text to the treasure chest
    private static void addText() {
        System.out.print("Enter the text ye wish to add: ");
        String newText = scanner.nextLine();
        textStorage.add(newText);
        System.out.println("Text added to the treasure chest!");
    }

    // Delete text from the treasure chest
    private static void deleteText() {
        System.out.print("Enter the index of the text ye wish to delete: ");
        int index = scanner.nextInt();
        scanner.nextLine(); // Consume the newline character

        if (index >= 0 && index < textStorage.size()) {
            textStorage.remove(index);
            System.out.println("Text removed from the treasure chest!");
        } else {
            System.out.println("Arrr! That be an invalid index.");
        }
    }

    // Display all the text in the treasure chest
    private static void displayText() {
        System.out.println("The contents of the treasure chest be:");
        for (int i = 0; i < textStorage.size(); i++) {
            System.out.println(i + ": " + textStorage.get(i));
        }
    }
}

