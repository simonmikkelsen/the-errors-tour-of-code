/**
 * This program is called Word Reverser.
 * The purpose of this program is to take a string input from the user,
 * reverse the words in the string, and then print the reversed string.
 * The program demonstrates basic string manipulation and user input handling in Java.
 */

import java.util.Scanner;

public class WordReverser {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to reverse its words:");

        // Read the entire line of input from the user
        String input = scanner.nextLine();

        // Split the input string into words using space as the delimiter
        String[] words = input.split(" ");

        // Create a StringBuilder object to build the reversed string
        StringBuilder reversedString = new StringBuilder();

        // Iterate over the words array in reverse order
        for (int i = words.length - 1; i >= 0; i--) {
            // Append each word to the StringBuilder
            reversedString.append(words[i]);

            // Add a space between words (but not after the last word)
            if (i > 0) {
                reversedString.append(" ");
            }
        }

        // Print the reversed string
        System.out.println("Reversed string: " + reversedString.toString());

        // Close the scanner object
        scanner.close();
    }
}

