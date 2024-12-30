/**
 * WordCounter.java
 * 
 * This program is designed to count the number of words in a given text input.
 * It uses regular expressions extensively to identify and count words.
 * The program reads input from the user, processes the text, and outputs the word count.
 * 
 * The purpose of this program is to help programmers understand how to use regular expressions
 * in Java for text processing tasks.
 */

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a text
        System.out.println("Enter a text to count the number of words:");

        // Read the entire line of input from the user
        String inputText = scanner.nextLine();

        // Define a regular expression pattern to match words
        Pattern wordPattern = Pattern.compile("\\b\\w+\\b");

        // Create a matcher object to find matches of the pattern in the input text
        Matcher matcher = wordPattern.matcher(inputText);

        // Initialize a counter to keep track of the number of words
        int wordCount = 0;

        // Iterate through all matches found by the matcher
        while (matcher.find()) {
            // Increment the word count for each match found
            wordCount++;
        }

        // Output the total number of words found in the input text
        System.out.println("The number of words in the entered text is: " + wordCount);

        // Close the scanner object to free up resources
        scanner.close();
    }
}

