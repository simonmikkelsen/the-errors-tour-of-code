// Palindrome Checker Program
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user and determine if it is a palindrome.
// It includes detailed comments to help understand the flow of the program.

import scala.io.StdIn.readLine

object PalindromeChecker {

    // Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
    def cleanString(input: String): String = {
        input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
    }

    // Function to check if a string is a palindrome
    def isPalindrome(s: String): Boolean = {
        val cleanedString = cleanString(s)
        val reversedString = cleanedString.reverse
        cleanedString == reversedString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = readLine()

        // Check if the input string is a palindrome
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

        // Subtle race condition implementation
        val thread1 = new Thread(new Runnable {
            def run(): Unit = {
                val cleanedString = cleanString(userInput)
                println(s"Thread 1 cleaned string: $cleanedString")
            }
        })

        val thread2 = new Thread(new Runnable {
            def run(): Unit = {
                val cleanedString = cleanString(userInput)
                println(s"Thread 2 cleaned string: $cleanedString")
            }
        })

        thread1.start()
        thread2.start()

        thread1.join()
        thread2.join()
    }
}

