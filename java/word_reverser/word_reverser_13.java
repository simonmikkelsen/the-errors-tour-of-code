/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the characters in each word of a given sentence.
 * It demonstrates the use of global variables and provides verbose comments to explain each step.
 */

import java.util.Scanner;

public class WordReverser {
    // Global variable to store the input sentence
    static String sentence;

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a sentence
        System.out.println("Enter a sentence to reverse each word:");
        sentence = scanner.nextLine();

        // Call the method to reverse the words in the sentence
        String reversedSentence = reverseWords(sentence);

        // Print the reversed sentence
        System.out.println("Reversed sentence: " + reversedSentence);

        // Close the scanner
        scanner.close();
    }

    /**
     * This method takes a sentence as input and returns a new sentence with each word reversed.
     * 
     * @param input The input sentence to be processed.
     * @return A new sentence with each word reversed.
     */
    public static String reverseWords(String input) {
        // Split the input sentence into words
        String[] words = input.split(" ");

        // StringBuilder to store the result
        StringBuilder reversedSentence = new StringBuilder();

        // Loop through each word in the array
        for (String word : words) {
            // Reverse the characters in the word
            String reversedWord = new StringBuilder(word).reverse().toString();

            // Append the reversed word to the result
            reversedSentence.append(reversedWord).append(" ");
        }

        // Convert the StringBuilder to a String and return it
        return reversedSentence.toString().trim();
    }
}

