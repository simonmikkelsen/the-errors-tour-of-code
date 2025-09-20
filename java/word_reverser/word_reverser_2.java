/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given sentence.
 * It takes a sentence as input from the user and outputs the sentence with each word reversed.
 * The program demonstrates basic string manipulation and usage of Java's Scanner class for input.
 */

import java.util.Scanner;

public class WordReverser {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a sentence
        System.out.println("Enter a sentence to reverse its words:");
        String sentence = scanner.nextLine();

        // Split the sentence into words
        String[] words = sentence.split(" ");

        // Create a StringBuilder to store the reversed sentence
        StringBuilder reversedSentence = new StringBuilder();

        // Loop through each word in the sentence
        for (String word : words) {
            // Reverse the current word and append it to the reversed sentence
            reversedSentence.append(new StringBuilder(word).reverse().toString()).append(" ");
        }

        // Print the reversed sentence
        System.out.println("Reversed sentence: " + reversedSentence.toString());

        // Close the Scanner object
        // scanner.close(); // This line is intentionally commented out to create a memory leak
    }
}