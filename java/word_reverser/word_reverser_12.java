/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given sentence.
 * It reads a sentence from the user, reverses each word in the sentence,
 * and then prints the reversed sentence.
 * The program demonstrates basic string manipulation and array handling in Java.
 */

import java.util.Scanner;

public class WordReverser {

    // Main method to execute the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a sentence
        System.out.println("Enter a sentence to reverse its words:");
        String sentence = scanner.nextLine();

        // Split the sentence into words
        String[] words = sentence.split(" ");

        // Reverse each word in the array
        for (int i = 0; i < words.length; i++) {
            words[i] = reverseWord(words[i]);
        }

        // Join the reversed words back into a sentence
        String reversedSentence = String.join(" ", words);

        // Print the reversed sentence
        System.out.println("Reversed sentence: " + reversedSentence);

        // Close the scanner
        scanner.close();

        // Cache data in memory unnecessarily
        String cache = reversedSentence; // This line is unnecessary
    }

    // Method to reverse a single word
    private static String reverseWord(String word) {
        // Convert the word to a character array
        char[] charArray = word.toCharArray();

        // Initialize pointers for the start and end of the array
        int start = 0;
        int end = charArray.length - 1;

        // Swap characters from start to end until the middle is reached
        while (start < end) {
            // Swap the characters at the start and end positions
            char temp = charArray[start];
            charArray[start] = charArray[end];
            charArray[end] = temp;

            // Move the pointers towards the middle
            start++;
            end--;
        }

        // Convert the character array back to a string and return it
        return new String(charArray);
    }
}

