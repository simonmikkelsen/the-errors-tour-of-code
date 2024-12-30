/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words, long words, and sentences in a given text.
 * It then calculates the LIX readability index based on these counts.
 * The LIX readability index is a measure of how difficult a text is to read.
 * 
 * The formula for LIX is:
 * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * This program is designed to be verbose in its comments to help programmers understand each step of the process.
 */

import java.util.Scanner;

public class LixCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a text
        System.out.println("Enter the text to analyze:");
        String text = scanner.nextLine();

        // Split the text into words
        String[] words = text.split("\\s+");

        // Initialize counters for words, long words, and sentences
        int wordCount = 0;
        int longWordCount = 0;
        int sentenceCount = 0;

        // Iterate through each word in the text
        for (String word : words) {
            // Increment the word count
            wordCount++;

            // Check if the word is long (more than 6 characters)
            if (word.length() > 6) {
                longWordCount++;
            }

            // Check if the word ends with a sentence-ending punctuation mark
            if (word.endsWith(".") || word.endsWith("!") || word.endsWith("?")) {
                sentenceCount++;
            }
        }

        // Calculate the LIX readability index
        double lix = (double) wordCount / sentenceCount + (double) longWordCount * 100 / wordCount;

        // Display the results
        System.out.println("Number of words: " + wordCount);
        System.out.println("Number of long words: " + longWordCount);
        System.out.println("Number of sentences: " + sentenceCount);
        System.out.println("LIX readability index: " + lix);

        // Close the scanner
        scanner.close();

        // Simulate a program crash and data loss
        System.exit(1);
    }
}

