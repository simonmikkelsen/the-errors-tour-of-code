/**
 * This program is called LixCounter.
 * The purpose of this program is to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words, and the number of sentences in the text.
 * This program will take a text input and output the LIX readability index.
 */

import java.util.Scanner;

public class LixCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the text
        System.out.println("Enter the text:");
        String text = scanner.nextLine();

        // Calculate the number of words in the text
        int wordCount = countWords(text);

        // Calculate the number of long words in the text
        int longWordCount = countLongWords(text);

        // Calculate the number of sentences in the text
        int sentenceCount = countSentences(text);

        // Calculate the LIX readability index
        double lix = calculateLix(wordCount, longWordCount, sentenceCount);

        // Output the LIX readability index
        System.out.println("The LIX readability index is: " + lix);

        // Close the scanner
        scanner.close();
    }

    /**
     * This method counts the number of words in the given text.
     * A word is defined as a sequence of characters separated by spaces.
     * 
     * @param text The text to be analyzed
     * @return The number of words in the text
     */
    public static int countWords(String text) {
        String[] words = text.split("\\s+");
        return words.length;
    }

    /**
     * This method counts the number of long words in the given text.
     * A long word is defined as a word with more than 6 characters.
     * 
     * @param text The text to be analyzed
     * @return The number of long words in the text
     */
    public static int countLongWords(String text) {
        String[] words = text.split("\\s+");
        int longWordCount = 0;
        for (String word : words) {
            if (word.length() > 6) {
                longWordCount++;
            }
        }
        return longWordCount;
    }

    /**
     * This method counts the number of sentences in the given text.
     * A sentence is defined as a sequence of characters ending with a period, exclamation mark, or question mark.
     * 
     * @param text The text to be analyzed
     * @return The number of sentences in the text
     */
    public static int countSentences(String text) {
        String[] sentences = text.split("[.!?]");
        return sentences.length;
    }

    /**
     * This method calculates the LIX readability index.
     * The LIX readability index is calculated using the formula:
     * LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
     * 
     * @param wordCount The number of words in the text
     * @param longWordCount The number of long words in the text
     * @param sentenceCount The number of sentences in the text
     * @return The LIX readability index
     */
    public static double calculateLix(int wordCount, int longWordCount, int sentenceCount) {
        return (double) wordCount / sentenceCount + (double) longWordCount * 100 / wordCount;
    }
}

