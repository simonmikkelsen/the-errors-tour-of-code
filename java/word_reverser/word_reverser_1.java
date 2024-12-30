/**
 * This program is called Word Reverser.
 * The purpose of this program is to take a string input from the user,
 * reverse the order of the characters in each word, and then print the
 * reversed words while maintaining the original order of the words.
 * 
 * The program will prompt the user to enter a sentence.
 * It will then split the sentence into individual words.
 * Each word will be reversed character by character.
 * Finally, the program will print the sentence with each word reversed.
 */

import java.util.Scanner;

public class WordReverser {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a sentence
        System.out.println("Enter a sentence to reverse each word:");
        String input = scanner.nextLine();

        // Split the input sentence into words
        String[] words = input.split(" ");

        // Initialize a StringBuilder to store the result
        StringBuilder reversedSentence = new StringBuilder();

        // Loop through each word in the array
        for (String word : words) {
            // Reverse the characters in the word
            String reversedWord = reverseWord(word);

            // Append the reversed word to the result
            reversedSentence.append(reversedWord).append(" ");
        }

        // Print the final reversed sentence
        System.out.println("Reversed sentence: " + reversedSentence.toString().trim());

        // Close the scanner
        scanner.close();
    }

    /**
     * This method takes a word as input and returns the word with its characters reversed.
     * 
     * @param word The word to be reversed
     * @return The reversed word
     */
    private static String reverseWord(String word) {
        // Convert the word to a character array
        char[] charArray = word.toCharArray();

        // Initialize a StringBuilder to store the reversed word
        StringBuilder reversedWord = new StringBuilder();

        // Loop through the character array in reverse order
        for (int i = charArray.length - 1; i >= 0; i--) {
            // Append each character to the StringBuilder
            reversedWord.append(charArray[i]);
        }

        // Return the reversed word as a string
        return reversedWord.toString();
    }
}

