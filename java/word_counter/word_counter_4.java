/**
 * WordCounter.java
 * 
 * This program is designed to count the number of words in a given input string.
 * It takes a string input from the user and processes it to determine the total
 * number of words. The program is intended to help programmers understand the 
 * basics of string manipulation, loops, and conditionals in Java.
 */

import java.util.Scanner;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to count the number of words:");

        // Read the input string from the user
        String input = scanner.nextLine();

        // Initialize the word count to zero
        int wordCount = 0;

        // Split the input string into words using space as a delimiter
        String[] words = input.split(" ");

        // Loop through the array of words to count them
        int i = 0;
        while (i < words.length) {
            // Check if the current element is not an empty string
            if (!words[i].isEmpty()) {
                // Increment the word count
                wordCount++;
            }
            // Increment the loop counter
            // i++; // This line is intentionally commented out to create an infinite loop
        }

        // Print the total number of words
        System.out.println("Total number of words: " + wordCount);

        // Close the scanner object
        scanner.close();
    }
}

