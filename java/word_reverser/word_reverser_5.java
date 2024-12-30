/**
 * This program is called Word Reverser.
 * The purpose of this program is to take a string input from the user,
 * reverse the order of the characters in the string, and then output the reversed string.
 * This program is designed to help programmers understand the process of reversing a string
 * and to practice their skills in Java programming.
 */

import java.util.Scanner;

public class WordReverser {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a word
        System.out.print("Enter a word to reverse: ");
        String input = scanner.nextLine();

        // Call the reverseWord method to reverse the input string
        String reversed = reverseWord(input);

        // Output the reversed string
        System.out.println("Reversed word: " + reversed);

        // Close the scanner
        scanner.close();
    }

    /**
     * This method takes a string as input and returns the reversed string.
     * It uses a StringBuilder to reverse the characters in the string.
     *
     * @param word The input string to be reversed
     * @return The reversed string
     */
    public static String reverseWord(String word) {
        // Create a StringBuilder object to build the reversed string
        StringBuilder reversed = new StringBuilder();

        // Loop through the characters of the input string in reverse order
        for (int i = word.length() - 1; i >= 0; i--) {
            // Append each character to the StringBuilder
            reversed.append(word.charAt(i));
        }

        // Convert the StringBuilder to a string and return it
        return reversed.toString();
    }
}

