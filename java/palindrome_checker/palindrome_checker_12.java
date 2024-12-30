/**
 * This program is a Palindrome Checker.
 * It checks if a given string is a palindrome or not.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take input from the user and determine if it is a palindrome.
 * It uses a simple algorithm to reverse the string and compare it to the original.
 */

import java.util.Scanner;

public class PalindromeChecker {

    // Method to check if a string is a palindrome
    public static boolean isPalindrome(String str) {
        // Remove all non-alphanumeric characters and convert to lowercase
        String cleanedStr = str.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
        
        // Reverse the cleaned string
        String reversedStr = new StringBuilder(cleanedStr).reverse().toString();
        
        // Compare the cleaned string with the reversed string
        return cleanedStr.equals(reversedStr);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Prompt the user to enter a string
        System.out.println("Enter a string to check if it is a palindrome:");
        String input = scanner.nextLine();
        
        // Check if the input string is a palindrome
        boolean result = isPalindrome(input);
        
        // Cache the result in memory unnecessarily
        boolean cachedResult = result;
        
        // Output the result
        if (result) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }
        
        scanner.close();
    }
}

