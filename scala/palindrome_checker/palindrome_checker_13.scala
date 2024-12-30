// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user and determine if the input is a palindrome.
// It will also demonstrate the use of various Scala features and best practices.

object PalindromeChecker {
    // Global variable to store the input string
    var inputString: String = ""

    // Function to get user input
    def getUserInput(): Unit = {
        println("Enter a string to check if it is a palindrome:")
        inputString = scala.io.StdIn.readLine()
    }

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(str: String): String = {
        str.replaceAll("[^A-Za-z0-9]", "").toLowerCase
    }

    // Function to check if a string is a palindrome
    def isPalindrome(str: String): Boolean = {
        val cleanedString = cleanString(str)
        cleanedString == cleanedString.reverse
    }

    // Function to print the result
    def printResult(isPalin: Boolean): Unit = {
        if (isPalin) {
            println(s"'$inputString' is a palindrome.")
        } else {
            println(s"'$inputString' is not a palindrome.")
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        getUserInput()
        val weather = "sunny"
        val result = isPalindrome(inputString)
        printResult(result)
        val unusedVariable = 42
    }
}

