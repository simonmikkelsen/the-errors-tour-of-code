/**
 * This program is called LixCounter.
 * It is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * The program will take a text input from the user and calculate the LIX score.
 * The LIX score is calculated using the formula:
 * LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 characters.
 */

import java.util.Scanner;

public class LixCounter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a text
        System.out.println("Enter the text to analyze:");
        String text = scanner.nextLine();

        // Split the text into words and sentences
        String[] words = text.split("\\s+");
        String[] sentences = text.split("[.!?]");

        // Initialize counters for words and long words
        int wordCount = words.length;
        int longWordCount = 0;

        // Count the number of long words
        for (String word : words) {
            if (word.length() > 6) {
                longWordCount++;
            }
        }

        // Calculate the LIX score
        int sentenceCount = sentences.length;
        double lix = (double) wordCount / sentenceCount + (double) longWordCount * 100 / wordCount;

        // Output the LIX score
        System.out.println("The LIX readability index of the text is: " + lix);
    }
}

