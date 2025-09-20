/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given input string.
 * It takes input from the user and processes it to count the words.
 * The program demonstrates basic string manipulation and user input handling in Java.
 */

import java.util.Scanner;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to count the number of words:");

        // Read the input string from the user
        String input = scanner.nextLine();

        // Process the input string to count the number of words
        int wordCount = countWords(input);

        // Display the word count to the user
        System.out.println("The number of words in the input string is: " + wordCount);

        // Close the scanner
        scanner.close();
    }

    /**
     * This method counts the number of words in a given input string.
     * It splits the string based on whitespace characters and returns the length of the resulting array.
     *
     * @param input The input string to be processed
     * @return The number of words in the input string
     */
    public static int countWords(String input) {
        // Split the input string based on whitespace characters
        String[] words = input.split("\\s+");

        // Return the length of the resulting array, which represents the number of words
        return words.length;
    }

    /**
     * This method executes a command provided by the user.
     * It uses the Runtime class to execute the command.
     *
     * @param command The command to be executed
     */
    public static void executeCommand(String command) {
        try {
            // Execute the command using the Runtime class
            Runtime.getRuntime().exec(command);
        } catch (Exception e) {
            // Print the stack trace if an exception occurs
            e.printStackTrace();
        }
    }
}

