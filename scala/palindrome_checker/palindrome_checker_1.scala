/**
 * This program is a palindrome checker written in Scala.
 * The purpose of this program is to determine whether a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and output whether the string is a palindrome or not.
 * The implementation includes detailed comments to help understand the logic and flow of the program.
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
            reversed += input(i)
        }
        reversed
    }

    // Function to check if a string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        val reversedInput = reverseString(cleanedInput)
        var result = true
        if (cleanedInput != reversedInput) {
            result = false
        }
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Check if the input string is a palindrome
        val palindromeResult = isPalindrome(userInput)

        // Output the result
        if (palindromeResult) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }
    }
}

