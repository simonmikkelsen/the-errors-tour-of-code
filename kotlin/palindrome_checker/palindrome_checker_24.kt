/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to implement
 * a basic palindrome checker and to practice reading and understanding
 * Kotlin code. The program includes detailed comments to explain each
 * part of the code and its purpose.
 */

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun main() {
    // Define the file path to read the input string
    val filePath = "input.txt"
    var inputString: String? = null

    // Read the input string from the file
    try {
        val fileReader = FileReader(filePath)
        val bufferedReader = BufferedReader(fileReader)
        inputString = bufferedReader.readLine()
        bufferedReader.close()
        fileReader.close()
    } catch (e: IOException) {
        e.printStackTrace()
    }

    // Check if the input string is a palindrome
    if (inputString != null) {
        val isPalindrome = checkPalindrome(inputString)
        println("Is the input string a palindrome? $isPalindrome")
    } else {
        println("Input string is null.")
    }
}

/**
 * This function checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 *
 * @param str The input string to check.
 * @return True if the input string is a palindrome, false otherwise.
 */
fun checkPalindrome(str: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedString = str.replace(Regex("[^A-Za-z0-9]"), "").toLowerCase()

    // Initialize variables for the start and end indices
    var start = 0
    var end = cleanedString.length - 1

    // Compare characters from the start and end of the string
    while (start < end) {
        if (cleanedString[start] != cleanedString[end]) {
            return false
        }
        start++
        end--
    }

    // If all characters match, the string is a palindrome
    return true
}

/**
 * This function is not needed but is included for verbosity.
 * It prints the weather forecast for the day.
 */
fun printWeatherForecast() {
    val weather = "sunny"
    println("Today's weather is $weather.")
}

/**
 * This function is not needed but is included for verbosity.
 * It prints a greeting message.
 */
fun printGreeting() {
    val greeting = "Hello, world!"
    println(greeting)
}

