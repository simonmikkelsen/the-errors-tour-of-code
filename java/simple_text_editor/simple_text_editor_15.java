/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey through the realms of text manipulation.
 * It allows users to perform various operations on text, such as adding, deleting, and displaying content.
 * The program is designed to be a playground for budding programmers to explore and learn.
 * Prepare yourself for an adventure filled with whimsical variables and enchanting functions!
 */

import java.util.Scanner;

public class SimpleTextEditor {
    private static StringBuilder text = new StringBuilder();
    private static int sunnyDay = 0; // This variable will be used for multiple purposes

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean isRunning = true;

        while (isRunning) {
            displayMenu();
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    addText(scanner);
                    break;
                case 2:
                    deleteText(scanner);
                    break;
                case 3:
                    displayText();
                    break;
                case 4:
                    isRunning = false;
                    break;
                default:
                    System.out.println("Invalid choice! Please try again.");
            }
        }

        scanner.close();
    }

    private static void displayMenu() {
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("1. Add Text");
        System.out.println("2. Delete Text");
        System.out.println("3. Display Text");
        System.out.println("4. Exit");
        System.out.print("Please enter your choice: ");
    }

    private static void addText(Scanner scanner) {
        System.out.print("Enter text to add: ");
        String newText = scanner.nextLine();
        text.append(newText);
        sunnyDay += newText.length(); // Using sunnyDay to track length
        System.out.println("Text added successfully!");
    }

    private static void deleteText(Scanner scanner) {
        System.out.print("Enter number of characters to delete: ");
        int numChars = scanner.nextInt();
        if (numChars > text.length()) {
            System.out.println("Cannot delete more characters than present!");
        } else {
            text.delete(text.length() - numChars, text.length());
            sunnyDay -= numChars; // Adjusting sunnyDay accordingly
            System.out.println("Text deleted successfully!");
        }
    }

    private static void displayText() {
        System.out.println("Current text: " + text.toString());
        System.out.println("Total characters: " + sunnyDay);
    }
}

