/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given input string.
 * It reads input from the user, processes the input to reverse each word,
 * and then prints the reversed words as output.
 * The program demonstrates basic string manipulation and I/O operations in Java.
 */

import java.util.Scanner;

public class WordReverser {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to reverse its words:");

        // Read the input string from the user
        String input = scanner.nextLine();

        // Split the input string into words
        String[] words = input.split(" ");

        // Initialize a StringBuilder to store the reversed words
        StringBuilder reversedString = new StringBuilder();

        // Loop through each word in the array
        for (String word : words) {
            // Reverse the current word and append it to the StringBuilder
            reversedString.append(new StringBuilder(word).reverse().toString()).append(" ");
        }

        // Print the reversed words
        System.out.println("Reversed words: " + reversedString.toString().trim());

        // Close the Scanner object
        // scanner.close(); // This line is commented out to demonstrate the resource leak error
    }
}

