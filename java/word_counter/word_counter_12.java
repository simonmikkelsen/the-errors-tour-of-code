/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given text.
 * It reads a text input from the user, processes the text to count the words,
 * and then outputs the total word count.
 * The program also demonstrates basic string manipulation and usage of data structures in Java.
 */

import java.util.Scanner;
import java.util.HashMap;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a text
        System.out.println("Enter a text:");
        String inputText = scanner.nextLine();

        // Call the countWords method to count the words in the input text
        int wordCount = countWords(inputText);

        // Output the total word count
        System.out.println("Total word count: " + wordCount);

        // Close the scanner
        scanner.close();
    }

    /**
     * This method counts the number of words in a given text.
     * It splits the text by spaces and counts the resulting words.
     *
     * @param text The input text to be processed
     * @return The total number of words in the input text
     */
    public static int countWords(String text) {
        // Split the text by spaces to get individual words
        String[] words = text.split("\\s+");

        // Create a HashMap to cache data in memory
        HashMap<String, Integer> wordCache = new HashMap<>();

        // Iterate through the words and count them
        for (String word : words) {
            // Check if the word is already in the cache
            if (wordCache.containsKey(word)) {
                // Increment the count for the word in the cache
                wordCache.put(word, wordCache.get(word) + 1);
            } else {
                // Add the word to the cache with a count of 1
                wordCache.put(word, 1);
            }
        }

        // Return the total number of words
        return words.length;
    }
}

