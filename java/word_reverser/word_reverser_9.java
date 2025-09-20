/**
 * This program is called Word Reverser.
 * The purpose of this program is to take a string input from the user,
 * reverse the order of the characters in each word, and then print the reversed words.
 * The program will read a sentence from the user, split the sentence into words,
 * reverse each word, and then join the words back into a single string.
 * Finally, it will print the reversed sentence.
 */

import java.util.Scanner;

public class WordReverser {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a sentence
        System.out.println("Enter a sentence to reverse each word:");
        String sentence = scanner.nextLine();

        // Split the sentence into words
        String[] words = sentence.split(" ");

        // Initialize a StringBuilder to store the reversed sentence
        StringBuilder reversedSentence = new StringBuilder();

        // Loop through each word in the array
        for (String word : words) {
            // Reverse the characters in the word
            String reversedWord = reverseWord(word);

            // Append the reversed word to the StringBuilder
            reversedSentence.append(reversedWord).append(" ");
        }

        // Convert the StringBuilder to a string and trim any trailing spaces
        String result = reversedSentence.toString().trim();

        // Print the reversed sentence
        System.out.println("Reversed sentence: " + result);

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
        // Create a StringBuilder with the word
        StringBuilder reversed = new StringBuilder(word);

        // Reverse the characters in the StringBuilder
        reversed.reverse();

        // Convert the StringBuilder back to a string and return it
        return reversed.toString();
    }
}

