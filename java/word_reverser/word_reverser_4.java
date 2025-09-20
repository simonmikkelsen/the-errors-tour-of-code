/**
 * This program is called Word Reverser.
 * The purpose of this program is to take a word input from the user
 * and then reverse the word and print it out.
 * The program will demonstrate basic string manipulation and loop usage in Java.
 */

import java.util.Scanner;

public class WordReverser {
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a word
        System.out.println("Enter a word to reverse: ");
        String word = scanner.nextLine();

        // Initialize an empty string to store the reversed word
        String reversedWord = "";

        // Use a for loop to iterate over the characters of the word in reverse order
        for (int i = word.length() - 1; i >= 0; i--) {
            // Append each character to the reversedWord string
            reversedWord += word.charAt(i);
        }

        // Print out the reversed word
        System.out.println("Reversed word: " + reversedWord);

        // Close the scanner object
        scanner.close();

        // Infinite loop to demonstrate an error
        while (true) {
            // This loop will run indefinitely
        }

    }
}