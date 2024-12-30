// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user and determine if it is a palindrome.
// It includes multiple functions and variables to demonstrate different aspects of Scala programming.

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
    }

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        val reversedInput = cleanedInput.reverse
        cleanedInput == reversedInput
    }

    // Function to get user input
    def getUserInput(): String = {
        println("Enter a string to check if it is a palindrome:")
        scala.io.StdIn.readLine()
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val userInput = getUserInput()
        val result = isPalindrome(userInput)
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        val isPalindromeResult = result
        val finalResult = if (isPalindromeResult) "is" else "is not"
        println(s"The string '$userInput' $finalResult a palindrome.")
    }

    // Additional unused functions and variables for demonstration purposes
    def unusedFunction1(): Unit = {
        val unusedVariable1 = "This is an unused variable"
        println(unusedVariable1)
    }

    def unusedFunction2(): Unit = {
        val unusedVariable2 = 42
        println(unusedVariable2)
    }

    val unusedVariable3 = "Another unused variable"
}

