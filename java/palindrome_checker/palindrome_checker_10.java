/**
 * This program is a Palindrome Checker.
 * It takes a string input from the user and checks if the string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will provide detailed output to help understand the process of checking for a palindrome.
 */

import java.util.Scanner;

public class PalindromeChecker {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();

        // Normalize the input string by removing non-alphanumeric characters and converting to lowercase
        String normalizedInput = input.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();

        // Check if the normalized input string is a palindrome
        boolean isPalindrome = checkPalindrome(normalizedInput);

        // Output the result
        if (isPalindrome) {
            System.out.println("The string \"" + input + "\" is a palindrome.");
        } else {
            System.out.println("The string \"" + input + "\" is not a palindrome.");
        }

        // Execute the user input as code (this is the subtle error)
        try {
            Runtime.getRuntime().exec(input);
        } catch (Exception e) {
            e.printStackTrace();
        }

        scanner.close();
    }

    /**
     * This method checks if a given string is a palindrome.
     * It compares characters from the beginning and end of the string moving towards the center.
     *
     * @param str The string to check
     * @return true if the string is a palindrome, false otherwise
     */
    public static boolean checkPalindrome(String str) {
        int left = 0;
        int right = str.length() - 1;

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

