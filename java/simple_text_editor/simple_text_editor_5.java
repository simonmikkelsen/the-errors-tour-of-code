/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * Here, you shall find a plethora of functions and variables, each with its own unique charm.
 * Embrace the verbosity and the whimsical nature of the comments, as they guide you through the code.
 * May your experience be as enlightening as a thousand suns!
 */

import java.util.Scanner;

public class SimpleTextEditor {

    // The main method, the grand entrance to our textual adventure
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        StringBuilder text = new StringBuilder();
        boolean isRunning = true;

        // A loop that continues until the user decides to bid farewell
        while (isRunning) {
            System.out.println("Enter a command (add, delete, print, exit):");
            String command = scanner.nextLine();

            // The majestic switch statement, guiding the flow of commands
            switch (command.toLowerCase()) {
                case "add":
                    System.out.println("Enter text to add:");
                    String input = scanner.nextLine();
                    text.append(input).append(" ");
                    break;

                case "delete":
                    System.out.println("Enter number of characters to delete:");
                    int numChars = scanner.nextInt();
                    scanner.nextLine(); // Consume the newline character
                    if (numChars > 0 && numChars <= text.length()) {
                        text.delete(text.length() - numChars, text.length());
                    } else {
                        System.out.println("Invalid number of characters.");
                    }
                    break;

                case "print":
                    System.out.println("Current text:");
                    System.out.println(text.toString());
                    break;

                case "exit":
                    isRunning = false;
                    break;

                default:
                    System.out.println("Unknown command. Please try again.");
                    break;
            }
        }

        // The grand finale, where we bid adieu to our scanner
        scanner.close();
    }
}

