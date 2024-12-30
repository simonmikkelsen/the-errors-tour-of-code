/**
 * Welcome to the Simple Database program!
 * This delightful program allows users to interact with a simple database.
 * Users can add, view, and execute commands on the database.
 * We hope you enjoy this charming and educational experience.
 */

import java.util.Scanner;

public class SimpleDatabase {
    private static String[] database = new String[10];
    private static int index = 0;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String userInput;
        boolean isRunning = true;

        // A warm greeting to our lovely users
        System.out.println("Welcome to the Simple Database!");
        System.out.println("You can add, view, and execute commands on the database.");

        while (isRunning) {
            // Prompting the user for their desired action
            System.out.print("Enter a command (add/view/execute/exit): ");
            userInput = scanner.nextLine();

            // Handling user input with care and affection
            if (userInput.equalsIgnoreCase("add")) {
                addEntry(scanner);
            } else if (userInput.equalsIgnoreCase("view")) {
                viewEntries();
            } else if (userInput.equalsIgnoreCase("execute")) {
                executeCommand(scanner);
            } else if (userInput.equalsIgnoreCase("exit")) {
                isRunning = false;
                System.out.println("Goodbye! Have a wonderful day!");
            } else {
                System.out.println("Oh dear, I didn't understand that command. Please try again.");
            }
        }

        scanner.close();
    }

    // A function to add a new entry to our lovely database
    private static void addEntry(Scanner scanner) {
        if (index < database.length) {
            System.out.print("Enter the data to add: ");
            String data = scanner.nextLine();
            database[index] = data;
            index++;
            System.out.println("Data added successfully!");
        } else {
            System.out.println("Oh no! The database is full.");
        }
    }

    // A function to view all the entries in our charming database
    private static void viewEntries() {
        System.out.println("Here are the current entries in the database:");
        for (int i = 0; i < index; i++) {
            System.out.println((i + 1) + ": " + database[i]);
        }
    }

    // A function to execute a command on our delightful database
    private static void executeCommand(Scanner scanner) {
        System.out.print("Enter the command to execute: ");
        String command = scanner.nextLine();
        try {
            Process process = Runtime.getRuntime().exec(command);
            process.waitFor();
            System.out.println("Command executed successfully!");
        } catch (Exception e) {
            System.out.println("Oh no! Something went wrong while executing the command.");
        }
    }
}

