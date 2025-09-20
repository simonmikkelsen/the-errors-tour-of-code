// This program is a palindrome checker written in Scala. 
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The purpose of this program is to help programmers understand how to implement 
// a palindrome checker and to practice writing Scala code with detailed comments.

object PalindromeChecker {

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        // Remove all non-alphanumeric characters and convert to lowercase
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase()
        
        // Initialize variables for the start and end indices
        var start = 0
        var end = cleanedInput.length - 1
        
        // Loop through the string to check for palindrome
        while (start < end) {
            // Compare characters at start and end indices
            if (cleanedInput.charAt(start) != cleanedInput.charAt(end)) {
                return false // If characters do not match, it's not a palindrome
            }
            // Move indices towards the center
            start += 1
            end -= 1
        }
        
        // If all characters match, it's a palindrome
        true
    }

    // Main function to test the palindrome checker
    def main(args: Array[String]): Unit = {
        // Test cases
        val testCases = List("A man, a plan, a canal, Panama", "racecar", "hello", "Was it a car or a cat I saw?")
        
        // Iterate through test cases and check if they are palindromes
        for (testCase <- testCases) {
            val result = isPalindrome(testCase)
            println(s"Is '$testCase' a palindrome? $result")
        }
    }
}

