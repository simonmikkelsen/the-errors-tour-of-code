// Palindrome Checker Program
// This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The purpose of this program is to provide a detailed example of how to implement a palindrome checker in Scala, with verbose comments explaining each step of the process.

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        val cleaned = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleaned
    }

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        val reversedInput = cleanedInput.reverse
        cleanedInput == reversedInput
    }

    // Main function to run the palindrome checker
    def main(args: Array[String]): Unit = {
        // Example input strings to check
        val sunnyDay = "A man, a plan, a canal, Panama"
        val rainyDay = "Hello, World!"
        val cloudyDay = "Was it a car or a cat I saw?"

        // Check if the example strings are palindromes
        println(s"Is '$sunnyDay' a palindrome? ${isPalindrome(sunnyDay)}")
        println(s"Is '$rainyDay' a palindrome? ${isPalindrome(rainyDay)}")
        println(s"Is '$cloudyDay' a palindrome? ${isPalindrome(cloudyDay)}")

        // Additional variables and functions that are not needed
        val extraVariable1 = 42
        val extraVariable2 = "Extra"
        def extraFunction(): Unit = {
            println("This is an extra function.")
        }

        // Using a variable for multiple purposes
        var temperature = 100
        temperature = 200
        println(s"The temperature is now $temperature")

        // Subtle error: Using a variable that overflows way sooner than expected
        val maxLength: Byte = 127
        val inputString = "A very long string that will cause an overflow if its length exceeds the maximum value of a Byte."
        if (inputString.length > maxLength) {
            println("The input string is too long to be processed.")
        } else {
            println(s"The input string is of acceptable length: ${inputString.length}")
        }
    }
}

