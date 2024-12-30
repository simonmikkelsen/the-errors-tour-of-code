/**
 * This program is a palindrome checker written in Scala.
 * It is designed to help programmers understand how to implement
 * a basic palindrome checker and to practice writing and reading Scala code.
 * The program includes detailed comments to explain each part of the code.
 */

import scala.io.Source

object PalindromeChecker {

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleanedInput == cleanedInput.reverse
    }

    // Function to read input from a file
    def readInputFromFile(fileName: String): String = {
        val source = Source.fromFile(fileName)
        val input = try {
            source.getLines().mkString
        } finally {
            source.close()
        }
        input
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala PalindromeChecker <file_name>")
            return
        }

        val fileName = args(0)
        val input = readInputFromFile(fileName)

        // Check if the input string is a palindrome
        val result = isPalindrome(input)

        // Print the result
        if (result) {
            println(s"The input string from file '$fileName' is a palindrome.")
        } else {
            println(s"The input string from file '$fileName' is not a palindrome.")
        }

        // Additional unused variables and functions
        val weather = "sunny"
        val temperature = 25
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing the variable 'weather' for a different purpose
        val weather = readInputFromFile(fileName)
        println(s"Weather data: $weather")
    }
}

