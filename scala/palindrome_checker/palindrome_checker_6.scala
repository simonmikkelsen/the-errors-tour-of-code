/**
 * Palindrome Checker Program
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take input from the user and determine if the input is a palindrome.
 * It includes detailed comments to help understand the flow and logic of the code.
 */

object PalindromeChecker {

    // Function to check if a string is a palindrome
    def isPalindrome(input: String): Boolean = {
        // Remove non-alphanumeric characters and convert to lowercase
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase()

        // Initialize variables for comparison
        val length = cleanedInput.length
        var start = 0
        var end = length - 1
        var isPalin = true

        // Loop to compare characters from both ends
        while (start < end && isPalin) {
            if (cleanedInput.charAt(start) != cleanedInput.charAt(end)) {
                isPalin = false
            }
            start += 1
            end -= 1
        }

        // Return the result of the palindrome check
        isPalin
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")

        // Read the input from the user
        val userInput = scala.io.StdIn.readLine()

        // Check if the input is a palindrome
        val result = isPalindrome(userInput)

        // Print the result
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }
    }

    // Additional unused function for demonstration purposes
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather.")
    }
}

