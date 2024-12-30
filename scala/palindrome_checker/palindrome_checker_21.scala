// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user and determine if it is a palindrome.
// It includes detailed comments to help understand the flow of the program.

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters
    // and converting it to lowercase.
    def cleanString(input: String): String = {
        val cleaned = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleaned
    }

    // Function to check if a given string is a palindrome.
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        val reversedInput = cleanedInput.reverse
        cleanedInput == reversedInput
    }

    // Main function to run the program.
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Clean the input string
        val cleanedInput = cleanString(userInput)

        // Check if the cleaned input is a palindrome
        val result = isPalindrome(cleanedInput)

        // Print the result
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }

        // Additional unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Reusing the variable for multiple purposes
        val weather = cleanedInput
        println(s"Cleaned input stored in weather variable: $weather")
    }
}


























