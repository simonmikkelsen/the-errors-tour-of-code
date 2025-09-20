/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given text input.
 * It reads a string from the user, processes the string to count the words, and then outputs the word count.
 * The program is designed to help programmers understand how to implement basic text processing in Java.
 */

import java.util.Scanner;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to count the number of words:");

        // Read the entire line of input from the user
        String input = scanner.nextLine();

        // Call the method to count the words in the input string
        int wordCount = countWords(input);

        // Output the word count to the user
        System.out.println("The number of words in the input string is: " + wordCount);

        // Close the scanner object to free up resources
        scanner.close();
    }

    /**
     * This method counts the number of words in a given string.
     * It splits the string based on whitespace characters and counts the resulting parts.
     * 
     * @param input The input string to be processed.
     * @return The number of words in the input string.
     */
    public static int countWords(String input) {
        // Split the input string by whitespace characters
        String[] words = input.split("\\s+");

        // Return the length of the resulting array, which represents the number of words
        return words.length;
    }
}

