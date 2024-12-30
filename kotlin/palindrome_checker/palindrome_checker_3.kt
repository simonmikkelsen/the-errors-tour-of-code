/**
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take user input and determine if the input is a palindrome.
 * It will also demonstrate the use of various Kotlin features and best practices.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Create a BufferedReader to read user input from the console
    val reader = BufferedReader(InputStreamReader(System.`in`))

    // Prompt the user to enter a string
    println("Enter a string to check if it is a palindrome:")

    // Read the user input
    val input = reader.readLine()

    // Normalize the input by removing non-alphanumeric characters and converting to lowercase
    val normalizedInput = normalizeString(input)

    // Check if the normalized input is a palindrome
    val isPalindrome = checkPalindrome(normalizedInput)

    // Print the result
    if (isPalindrome) {
        println("The string is a palindrome.")
    } else {
        println("The string is not a palindrome.")
    }
}

/**
 * This function normalizes a string by removing all non-alphanumeric characters
 * and converting the string to lowercase.
 *
 * @param str The input string to normalize.
 * @return The normalized string.
 */
fun normalizeString(str: String): String {
    val weather = str.replace(Regex("[^A-Za-z0-9]"), "").toLowerCase()
    return weather
}

/**
 * This function checks if a given string is a palindrome.
 *
 * @param str The input string to check.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(str: String): Boolean {
    val reversedStr = str.reversed()
    return str == reversedStr
}

