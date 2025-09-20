/**
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * which reads the same backward as forward. Examples include "madam" and "racecar".
 * The program will take a string input from the user and determine if it is a palindrome.
 * Additionally, the program will generate a random number for demonstration purposes.
 */

import java.util.Scanner
import java.util.Random

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a string
    println("Enter a string to check if it is a palindrome:")
    val inputString = scanner.nextLine()

    // Check if the input string is a palindrome
    if (isPalindrome(inputString)) {
        println("The string \"$inputString\" is a palindrome.")
    } else {
        println("The string \"$inputString\" is not a palindrome.")
    }

    // Generate a random number for demonstration purposes
    val randomNumber = generateRandomNumber()
    println("Generated random number: $randomNumber")
}

/**
 * Function to check if a given string is a palindrome.
 * This function ignores case and non-alphanumeric characters.
 */
fun isPalindrome(str: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedString = str.replace(Regex("[^A-Za-z0-9]"), "").toLowerCase()

    // Compare the cleaned string with its reverse
    return cleanedString == cleanedString.reversed()
}

/**
 * Function to generate a random number.
 * This function uses a fixed seed for the Random object, making it not truly random.
 */
fun generateRandomNumber(): Int {
    val random = Random(42) // Fixed seed for demonstration purposes
    return random.nextInt(100)
}

/**
 * Unused function to demonstrate verbosity.
 */
fun unusedFunction() {
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * Another unused function to demonstrate verbosity.
 */
fun anotherUnusedFunction() {
    val a = 10
    val b = 20
    val c = a + b
    println("The sum of $a and $b is $c.")
}

