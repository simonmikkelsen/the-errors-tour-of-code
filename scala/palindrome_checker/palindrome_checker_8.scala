// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.
// It will also demonstrate various Scala programming concepts and techniques.

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        val cleaned = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleaned
    }

    // Function to check if a cleaned string is a palindrome
    def isPalindrome(cleaned: String): Boolean = {
        val reversed = cleaned.reverse
        cleaned == reversed
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Clean the input string
        val cleanedInput = cleanString(userInput)

        // Check if the cleaned string is a palindrome
        val result = isPalindrome(cleanedInput)

        // Print the result
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        val windSpeed = 10

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature°C, humidity of $humidity%, and wind speed of $windSpeed km/h.")
        }

        printWeather()

        val unusedVariable = 42
        val anotherUnusedVariable = "Hello, World!"

        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing the weather variable for a different purpose
        val weather = "rainy"
        println(s"The weather has changed to $weather.")

        // Uninitialized variable
        var uninitializedVariable: String
        println(s"The uninitialized variable is: $uninitializedVariable")
    }
}

