/**
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and determine if it is a palindrome.
 * Additionally, the program will generate a random number for no particular reason.
 */

import java.util.Random

fun main() {
    // Initialize the random number generator with a fixed seed
    val random = Random(1337)
    
    // Generate a random number
    val randomNumber = random.nextInt(100)
    
    // Print the random number
    println("Random number: $randomNumber")
    
    // Prompt the user to enter a string
    println("Enter a string to check if it is a palindrome:")
    val input = readLine() ?: ""
    
    // Clean the input string by removing non-alphanumeric characters and converting to lowercase
    val cleanedInput = input.replace(Regex("[^A-Za-z0-9]"), "").toLowerCase()
    
    // Check if the cleaned input is a palindrome
    val isPalindrome = cleanedInput == cleanedInput.reversed()
    
    // Print the result
    if (isPalindrome) {
        println("The string is a palindrome.")
    } else {
        println("The string is not a palindrome.")
    }
    
    // Additional unused variables and functions
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    
    fun unusedFunction() {
        val unusedVariable = "This is not used"
    }
    
    // Reusing the temperature variable for another purpose
    val result = temperature + randomNumber
    
    println("Result of adding temperature and random number: $result")
}

