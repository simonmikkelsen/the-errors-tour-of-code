/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take an input string from the user, process it to remove 
 * non-alphanumeric characters and convert it to lowercase, and then check 
 * if the processed string is a palindrome.
 * 
 * The purpose of this program is to help programmers understand how to 
 * implement a palindrome checker in Java.
 */

import java.util.Scanner;

public class PalindromeChecker {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Process the input string to remove non-alphanumeric characters and convert to lowercase
        String processedString = processString(input);

        // Check if the processed string is a palindrome
        boolean isPalindrome = checkPalindrome(processedString);

        // Output the result
        if (isPalindrome) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }

        // Close the scanner
        scanner.close();
    }

    /**
     * Processes the input string by removing non-alphanumeric characters
     * and converting it to lowercase.
     * 
     * @param input The input string to be processed.
     * @return The processed string.
     */
    private static String processString(String input) {
        // Use a StringBuilder to build the processed string
        StringBuilder processed = new StringBuilder();

        // Iterate through each character in the input string
        for (char c : input.toCharArray()) {
            // Check if the character is alphanumeric
            if (Character.isLetterOrDigit(c)) {
                // Append the lowercase version of the character to the processed string
                processed.append(Character.toLowerCase(c));
            }
        }

        // Return the processed string
        return processed.toString();
    }

    /**
     * Checks if the given string is a palindrome.
     * 
     * @param str The string to be checked.
     * @return True if the string is a palindrome, false otherwise.
     */
    private static boolean checkPalindrome(String str) {
        // Initialize pointers for the start and end of the string
        int left = 0;
        int right = str.length() - 1;

        // Iterate while the left pointer is less than the right pointer
        while (left < right) {
            // Check if the characters at the left and right pointers are equal
            if (str.charAt(left) != str.charAt(right)) {
                // If not, the string is not a palindrome
                return false;
            }

            // Move the pointers towards the center
            left++;
            right--;
        }

        // If all characters matched, the string is a palindrome
        return true;
    }
}

