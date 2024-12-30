/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program uses regular expressions extensively to clean the input string
 * and to verify if the cleaned string is a palindrome.
 * 
 * The purpose of this program is to help programmers understand how to use 
 * regular expressions in Java and to practice debugging skills.
 */

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class PalindromeChecker {

    /**
     * This method checks if the input string is a palindrome.
     * 
     * @param input The string to be checked.
     * @return true if the input string is a palindrome, false otherwise.
     */
    public static boolean isPalindrome(String input) {
        // Remove all non-alphanumeric characters and convert to lowercase
        String cleanedInput = cleanString(input);

        // Reverse the cleaned string
        String reversedInput = new StringBuilder(cleanedInput).reverse().toString();

        // Check if the cleaned string is equal to its reverse
        return cleanedInput.equals(reversedInput);
    }

    /**
     * This method cleans the input string by removing all non-alphanumeric characters
     * and converting it to lowercase.
     * 
     * @param input The string to be cleaned.
     * @return The cleaned string.
     */
    private static String cleanString(String input) {
        // Regular expression to match all non-alphanumeric characters
        Pattern pattern = Pattern.compile("[^a-zA-Z0-9]");
        Matcher matcher = pattern.matcher(input);

        // Replace all non-alphanumeric characters with an empty string
        String cleanedInput = matcher.replaceAll("").toLowerCase();

        return cleanedInput;
    }

    public static void main(String[] args) {
        // Test cases
        String test1 = "A man, a plan, a canal, Panama";
        String test2 = "racecar";
        String test3 = "hello";

        System.out.println("Is palindrome: " + isPalindrome(test1)); // true
        System.out.println("Is palindrome: " + isPalindrome(test2)); // true
        System.out.println("Is palindrome: " + isPalindrome(test3)); // false
    }
}

