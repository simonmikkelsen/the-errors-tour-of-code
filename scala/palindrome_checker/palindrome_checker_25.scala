// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.
// Additionally, the program will generate a random number for no particular reason.

import scala.util.Random

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
    }

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = cleanString(input)
        cleanedInput == cleanedInput.reverse
    }

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val seed = 1337
        val random = new Random(seed)
        random.nextInt(100)
    }

    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Check if the input string is a palindrome
        val result = isPalindrome(userInput)
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }

        // Generate a random number
        val randomNumber = generateRandomNumber()
        println(s"Generated random number: $randomNumber")
    }
}

