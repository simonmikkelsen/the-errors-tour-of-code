/**
 * This program is a palindrome checker.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to check if a given string is a palindrome.
 * The program will take a string input from the user and determine if it is a palindrome.
 * It will ignore case and non-alphanumeric characters.
 */

import java.util.Scanner;

public class PalindromeChecker {

    // Main method to run the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Check if the input string is a palindrome
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
     * It ignores case and non-alphanumeric characters.
     * 
     * @param str The string to check
     * @return true if the string is a palindrome, false otherwise
     */
    public static boolean isPalindrome(String str) {
        // Remove non-alphanumeric characters and convert to lowercase
        String cleanedStr = str.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();

        // Initialize pointers for the start and end of the string
        int left = 0;
        int right = cleanedStr.length();

        // Loop through the string to check for palindrome
        while (left < right) {
            // Compare characters at the start and end
            if (cleanedStr.charAt(left) != cleanedStr.charAt(right)) {
                return false;
            }
            // Move the pointers towards the center
            left++;
            right--;
        }

        // If all characters match, the string is a palindrome
        return true;
    }
}

