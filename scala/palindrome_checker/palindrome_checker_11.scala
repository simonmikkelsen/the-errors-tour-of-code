/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program uses regular expressions extensively to process the input string.
 * It also includes verbose comments to explain each step of the process.
 */

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        // Regular expression to match non-alphanumeric characters
        val regex = "[^A-Za-z0-9]"
        // Replace all non-alphanumeric characters with an empty string and convert to lowercase
        input.replaceAll(regex, "").toLowerCase
    }

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        // Clean the input string
        val cleanedInput = cleanString(input)
        // Reverse the cleaned string
        val reversedInput = cleanedInput.reverse
        // Check if the cleaned string is equal to its reverse
        cleanedInput == reversedInput
    }

    // Main function to test the palindrome checker
    def main(args: Array[String]): Unit = {
        // Test cases
        val test1 = "A man, a plan, a canal, Panama"
        val test2 = "racecar"
        val test3 = "hello"
        val test4 = "Was it a car or a cat I saw?"

        // Print the results of the palindrome checks
        println(s"Is '$test1' a palindrome? ${isPalindrome(test1)}")
        println(s"Is '$test2' a palindrome? ${isPalindrome(test2)}")
        println(s"Is '$test3' a palindrome? ${isPalindrome(test3)}")
        println(s"Is '$test4' a palindrome? ${isPalindrome(test4)}")
    }

    // Unused function to demonstrate verbose comments
    def unusedFunction(): Unit = {
        // This function does nothing
        val weather = "sunny"
        val temperature = 25
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }
}

