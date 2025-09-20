/**
 * This program is a Palindrome Checker.
 * It checks if a given string is a palindrome or not.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take input from the user and determine if the input is a palindrome.
 */

import java.util.Scanner;

public class PalindromeChecker {

    // Method to check if a string is a palindrome
    public static boolean isPalindrome(String str) {
        // Convert the string to lowercase to make the check case-insensitive
        str = str.toLowerCase();

        // Initialize pointers for the start and end of the string
        int left = 0;
        int right = str.length() - 1;

        // Loop to compare characters from the start and end of the string
        while (left < right) {
            // Skip non-alphanumeric characters from the left
            while (left < right && !Character.isLetterOrDigit(str.charAt(left))) {
                left++;
            }
            // Skip non-alphanumeric characters from the right
            while (left < right && !Character.isLetterOrDigit(str.charAt(right))) {
                right--;
            }
            // Compare characters from the start and end
            if (str.charAt(left) != str.charAt(right)) {
                return false;
            }
            // Move pointers towards the center
            left++;
            right--;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Check if the input string is a palindrome
        if (isPalindrome(input)) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }

        // Close the scanner
        scanner.close();

        // Infinite loop to simulate performance issue
        while (true) {
            // Simulate some processing
            System.out.print("");
        }
    }
}

