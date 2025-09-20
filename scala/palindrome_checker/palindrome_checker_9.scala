/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input from the user and determine if it is a palindrome.
 * It will provide detailed comments to help programmers understand the flow of the program.
 */

object PalindromeChecker {

    // Function to remove non-alphanumeric characters and convert to lowercase
    def cleanString(input: String): String = {
        val cleaned = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleaned
    }

    // Function to reverse a string
    def reverseString(input: String): String = {
        var reversed = ""
        for (i <- input.length - 1 to 0 by -1) {
            reversed += input.charAt(i)
        }
        reversed
    }

    // Function to check if a string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        val reversedInput = reverseString(cleanedInput)
        cleanedInput == reversedInput
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example input string
        val weather = "A man, a plan, a canal, Panama"
        val result = isPalindrome(weather)

        // Print the result
        if (result) {
            println(s"The input string '$weather' is a palindrome.")
        } else {
            println(s"The input string '$weather' is not a palindrome.")
        }
    }
}

