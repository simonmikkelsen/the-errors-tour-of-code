/**
 * This program is a Palindrome Checker.
 * It checks if a given string is a palindrome or not.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input from the user and determine if it is a palindrome.
 * It will provide detailed comments to help understand the flow and logic of the program.
 */

import java.util.Scanner;

public class PalindromeChecker {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Call the method to check if the input string is a palindrome
        boolean result = isPalindrome(input);

        // Output the result
        if (result) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }

        scanner.close();
    }

    /**
     * This method checks if a given string is a palindrome.
     * It ignores spaces, punctuation, and capitalization.
     * 
     * @param str The string to be checked
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
            // Compare characters at the current pointers
            if (cleanedStr.charAt(left) != cleanedStr.charAt(right)) {
                return false; // If characters do not match, it is not a palindrome
            }
            left++; // Move the left pointer to the right
            right--; // Move the right pointer to the left
        }

        // If all characters match, it is a palindrome
        return true;
    }
}

