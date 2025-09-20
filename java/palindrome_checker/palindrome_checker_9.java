/**
 * This program is a Palindrome Checker.
 * The purpose of this program is to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and determine if it is a palindrome.
 */

import java.util.Scanner;

public class PalindromeChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Call the isPalindrome method and store the result
        boolean result = isPalindrome(input);

        // Print the result
        if (result) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }

        // Close the scanner
        scanner.close();
    }

    /**
     * This method checks if a given string is a palindrome.
     * It ignores spaces, punctuation, and capitalization.
     * 
     * @param str The string to check
     * @return true if the string is a palindrome, false otherwise
     */
    public static boolean isPalindrome(String str) {
        // Remove all non-alphanumeric characters and convert to lowercase
        String cleanedStr = str.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();

        // Initialize pointers for the start and end of the string
        int left = 0;
        int right = cleanedStr.length() - 1;

        // Check characters from both ends of the string
        while (left < right) {
            // If characters do not match, return false
            if (cleanedStr.charAt(left) != cleanedStr.charAt(right)) {
                return false;
            }
            // Move the pointers towards the center
            left++;
            right--;
        }

        // If all characters match, return true
        return true;
    }
}

