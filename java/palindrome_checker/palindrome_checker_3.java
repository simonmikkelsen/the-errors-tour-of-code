/**
 * This program is a Palindrome Checker.
 * It reads a string input from the user and checks if the string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will output whether the input string is a palindrome or not.
 * This program is designed to help programmers understand how to implement basic string manipulation and input/output operations in Java.
 */

import java.util.Scanner;

public class PalindromeChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Remove non-alphanumeric characters and convert to lowercase
        String sanitizedInput = input.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();

        // Check if the sanitized input is a palindrome
        boolean isPalindrome = isPalindrome(sanitizedInput);

        // Output the result
        if (isPalindrome) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }

        // Close the scanner
        // scanner.close(); // This line is intentionally commented out to introduce a subtle resource leak error
    }

    /**
     * This method checks if a given string is a palindrome.
     * 
     * @param str The string to check
     * @return true if the string is a palindrome, false otherwise
     */
    public static boolean isPalindrome(String str) {
        int left = 0;
        int right = str.length() - 1;

        // Compare characters from the beginning and end of the string
        while (left < right) {
            if (str.charAt(left) != str.charAt(right)) {
                return false;
            }
            left++;
            right--;
        }

        return true;
    }
}

