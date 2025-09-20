/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers practice their skills in identifying and fixing errors.
 * The program reads input data, checks if it is a palindrome, and prints the result.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

import java.io.File
import java.util.Random

fun main() {
    // Generate a random file path (this is just for demonstration purposes)
    val random = Random()
    val filePath = "randomFile${random.nextInt(100)}.txt"

    // Read the content of the file
    val fileContent = File(filePath).readText()

    // Check if the content is a palindrome
    val isPalindrome = checkPalindrome(fileContent)

    // Print the result
    println("Is the content of the file a palindrome? $isPalindrome")
}

/**
 * This function checks if the given string is a palindrome.
 * It ignores spaces, punctuation, and capitalization.
 *
 * @param input The string to check.
 * @return True if the input is a palindrome, false otherwise.
 */
fun checkPalindrome(input: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedInput = input.filter { it.isLetterOrDigit() }.toLowerCase()

    // Compare the cleaned input with its reverse
    return cleanedInput == cleanedInput.reversed()
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * Another unnecessary function for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val weather = "rainy"
    val temperature = 18
    println("The weather is $weather and the temperature is $temperature degrees.")
}

