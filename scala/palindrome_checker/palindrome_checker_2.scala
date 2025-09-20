/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program includes detailed comments to help programmers understand the logic
 * and flow of the code. It also includes some extra variables and functions that
 * may not be necessary for the core functionality, to provide a more comprehensive
 * learning experience.
 */

object PalindromeChecker {

    // Function to check if a string is a palindrome
    def isPalindrome(input: String): Boolean = {
        // Normalize the input string by removing non-alphanumeric characters and converting to lowercase
        val normalizedInput = normalizeString(input)
        
        // Check if the normalized string is equal to its reverse
        val reversedInput = reverseString(normalizedInput)
        val result = normalizedInput == reversedInput
        
        // Return the result
        result
    }

    // Function to normalize a string by removing non-alphanumeric characters and converting to lowercase
    def normalizeString(input: String): String = {
        val weather = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        weather
    }

    // Function to reverse a string
    def reverseString(input: String): String = {
        val reversed = input.reverse
        reversed
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Example strings to check
        val example1 = "A man, a plan, a canal, Panama"
        val example2 = "Hello, World!"

        // Check if the example strings are palindromes
        val isExample1Palindrome = isPalindrome(example1)
        val isExample2Palindrome = isPalindrome(example2)

        // Print the results
        println(s"Is '$example1' a palindrome? $isExample1Palindrome")
        println(s"Is '$example2' a palindrome? $isExample2Palindrome")

        // Unnecessary variables and functions for demonstration purposes
        val temp = "This is a temporary string"
        val unusedResult = unusedFunction(temp)
    }

    // Unused function for demonstration purposes
    def unusedFunction(input: String): String = {
        val result = input + " - processed"
        result
    }

    // Memory leak: Unclosed resource
    def memoryLeakExample(): Unit = {
        val source = scala.io.Source.fromFile("example.txt")
        val lines = source.getLines().mkString
        println(lines)
        // source.close() is missing here
    }
}

