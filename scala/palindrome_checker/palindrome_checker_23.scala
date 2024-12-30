/**
 * This program is a palindrome checker written in Scala.
 * The purpose of this program is to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take input from the user and determine if the input is a palindrome.
 * It will also include detailed comments to help understand the flow of the program.
 */

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

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Check if the input string is a palindrome
        val result = isPalindrome(userInput)

        // Print the result
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }

        // Self-modifying code (subtle error)
        val weather = "sunny"
        val code = "println(\"This is a subtle error.\")"
        val file = new java.io.PrintWriter("error.scala")
        try {
            file.write(code)
        } finally {
            file.close()
        }
        scala.sys.process.Process("scala error.scala").!
    }
}

