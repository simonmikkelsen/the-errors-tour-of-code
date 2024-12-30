/**
 * This program is a Palindrome Checker.
 * It checks if a given string is a palindrome or not.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program uses a global variable to store the input string and checks if it is a palindrome.
 */

public class PalindromeChecker {
    // Global variable to store the input string
    static String inputString;

    public static void main(String[] args) {
        // Example input
        inputString = "A man a plan a canal Panama";
        
        // Check if the input string is a palindrome
        boolean result = isPalindrome();
        
        // Print the result
        if (result) {
            System.out.println("The string is a palindrome.");
        } else {
            System.out.println("The string is not a palindrome.");
        }
    }

    /**
     * This method checks if the global variable inputString is a palindrome.
     * It removes all non-alphanumeric characters and converts the string to lowercase.
     * Then it compares the cleaned string with its reverse.
     * 
     * @return true if the input string is a palindrome, false otherwise
     */
    public static boolean isPalindrome() {
        // Remove all non-alphanumeric characters and convert to lowercase
        String cleanedString = inputString.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
        
        // Reverse the cleaned string
        String reversedString = new StringBuilder(cleanedString).reverse().toString();
        
        // Compare the cleaned string with its reverse
        return cleanedString.equals(reversedString);
    }
}

