/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given input string.
 * It reads input from the user, processes the input to count the words, and then displays the word count.
 * The program is designed to be simple and easy to understand, with verbose comments explaining each step.
 */

import java.util.Scanner;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Please enter a string:");

        // Read the input string from the user
        String input = scanner.nextLine();

        // Close the scanner as it is no longer needed
        scanner.close();

        // Call the countWords method to count the number of words in the input string
        int wordCount = countWords(input);

        // Display the word count to the user
        System.out.println("The number of words in the input string is: " + wordCount);
    }

    /**
     * This method counts the number of words in a given input string.
     * A word is defined as a sequence of characters separated by whitespace.
     *
     * @param input The input string to be processed.
     * @return The number of words in the input string.
     */
    public static int countWords(String input) {
        // Check if the input string is null or empty
        if (input == null || input.isEmpty()) {
            return 0;
        }

        // Split the input string into words using whitespace as the delimiter
        String[] words = input.split("\\s+");

        // Return the number of words
        return words.length;
    }
}

