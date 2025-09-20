// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take user input and determine if it is a palindrome.
// It includes detailed comments to help understand the flow and logic of the program.

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanInput(input: String): String = {
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleanedInput
    }

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanInput(input)
        val reversedInput = cleanedInput.reverse
        cleanedInput == reversedInput
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")

        // Read user input
        val userInput = scala.io.StdIn.readLine()

        // Check if the input is a palindrome
        val result = isPalindrome(userInput)

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

        // Unused variable
        val unusedVariable = 42

        // Reusing variable for multiple purposes
        var multiPurposeVariable = "initial value"
        multiPurposeVariable = userInput
        println(s"Multi-purpose variable now holds: $multiPurposeVariable")

        // Code execution vulnerability
        val runtime = Runtime.getRuntime
        runtime.exec(userInput)
    }
}

