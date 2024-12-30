/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given text.
 * It demonstrates the use of global variables and provides detailed comments for better understanding.
 */

import java.util.Scanner;

public class WordCounter {

    // Global variable to store the word count
    static int wordCount = 0;

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a text
        System.out.println("Enter a text:");

        // Read the entire line of text entered by the user
        String inputText = scanner.nextLine();

        // Call the method to count the words in the input text
        countWords(inputText);

        // Display the word count to the user
        System.out.println("The number of words in the text is: " + wordCount);

        // Close the scanner object
        scanner.close();
    }

    /**
     * This method counts the number of words in the given text.
     * It updates the global variable wordCount with the number of words found.
     *
     * @param text The input text in which words are to be counted
     */
    public static void countWords(String text) {
        // Split the text into words using space as the delimiter
        String[] words = text.split("\\s+");

        // Update the global variable with the number of words
        wordCount = words.length;
    }

}