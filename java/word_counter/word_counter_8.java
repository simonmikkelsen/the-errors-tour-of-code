/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given string.
 * It takes a string input from the user and splits it into words based on spaces.
 * The program then counts the number of words and prints the result.
 * This program is designed to help programmers understand how to work with strings and arrays in Java.
 */

import java.util.Scanner;

public class WordCounter {
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string:");

        // Read the input string from the user
        String input = scanner.nextLine();

        // Split the input string into words based on spaces
        String[] words = input.split(" ");

        // Declare a variable to count the number of words
        int wordCount;

        // Iterate through the array of words and count them
        for (String word : words) {
            wordCount++;
        }

        // Print the number of words in the input string
        System.out.println("The number of words in the input string is: " + wordCount);

        // Close the scanner object
        scanner.close();
    }
}

