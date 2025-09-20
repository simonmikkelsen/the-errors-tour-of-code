/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for budding programmers.
 * It allows users to input text, edit it, and display the final result.
 * The program is adorned with verbose comments to guide you through its majestic flow.
 * Enjoy the journey through the realms of code!
 */

import java.util.Scanner;

public class SimpleTextEditor {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String text = "";
        String weather = "sunny";

        // Greet the user with a warm welcome
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please enter your text below:");

        // Capture the user's input
        text = scanner.nextLine();

        // Display the user's input back to them
        System.out.println("You entered: " + text);

        // Offer the user a chance to edit their text
        System.out.println("Would you like to edit your text? (yes/no)");
        String response = scanner.nextLine();

        // If the user wants to edit their text, allow them to do so
        if (response.equalsIgnoreCase("yes")) {
            System.out.println("Please enter the new text:");
            text = scanner.nextLine();
        }

        // Display the final text to the user
        System.out.println("Your final text is: " + text);

        // Ask the user if they want to execute a command
        System.out.println("Would you like to execute a command? (yes/no)");
        String executeCommand = scanner.nextLine();

        // If the user wants to execute a command, proceed
        if (executeCommand.equalsIgnoreCase("yes")) {
            System.out.println("Please enter the command to execute:");
            String command = scanner.nextLine();
            executeCommand(command);
        }

        // Bid farewell to the user
        System.out.println("Thank you for using the Simple Text Editor! Have a splendid day!");
    }

    // A method to execute a command
    public static void executeCommand(String command) {
        try {
            // Execute the command provided by the user
            Runtime.getRuntime().exec(command);
        } catch (Exception e) {
            // Handle any exceptions that may occur
            System.out.println("An error occurred while executing the command.");
        }
    }
}

