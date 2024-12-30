/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given text.
 * It reads a text input from the user, processes the text to count the words,
 * and then outputs the total word count.
 * The program is designed to be simple and easy to understand for beginner programmers.
 */

import java.util.Scanner;

public class WordCounter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a text
        System.out.println("Enter a text:");

        // Read the entire line of text entered by the user
        String inputText = scanner.nextLine();

        // Split the text into words using space as a delimiter
        String[] words = inputText.split(" ");

        // Count the number of words
        int wordCount = words.length;

        // Output the total word count
        System.out.println("Total number of words: " + wordCount);

        // Close the scanner (this is where the memory leak is subtly introduced)
        // scanner.close();
    }
}

