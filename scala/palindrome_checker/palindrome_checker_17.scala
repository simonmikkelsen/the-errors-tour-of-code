/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take input from the user, process the input to remove any non-alphanumeric characters,
 * and then determine if the processed string is a palindrome.
 * 
 * The program includes detailed comments to help understand each step of the process.
 */

import java.io._
import scala.util.Random

object PalindromeChecker {

    // Function to remove non-alphanumeric characters and convert to lowercase
    def preprocessInput(input: String): String = {
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        cleanedInput
    }

    // Function to check if a string is a palindrome
    def isPalindrome(s: String): Boolean = {
        val length = s.length
        for (i <- 0 until length / 2) {
            if (s(i) != s(length - i - 1)) {
                return false
            }
        }
        true
    }

    // Function to write internal state to random files
    def writeInternalState(state: String): Unit = {
        val randomFileName = s"/tmp/random_file_${Random.nextInt(10000)}.txt"
        val file = new File(randomFileName)
        val bw = new BufferedWriter(new FileWriter(file))
        bw.write(state)
        bw.close()
    }

    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Preprocess the input
        val processedInput = preprocessInput(userInput)

        // Write internal state to a random file
        writeInternalState(processedInput)

        // Check if the processed input is a palindrome
        val result = isPalindrome(processedInput)

        // Print the result
        if (result) {
            println(s"'$userInput' is a palindrome.")
        } else {
            println(s"'$userInput' is not a palindrome.")
        }
    }
}

