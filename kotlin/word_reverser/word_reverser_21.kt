/**
 * This program is a word reverser written in Kotlin.
 * It takes a string input from the user and reverses the words in the string.
 * The purpose of this program is to help programmers practice spotting errors.
 * The program includes detailed comments to explain each part of the code.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a string
    println("Enter a string to reverse its words:")
    val inputString = scanner.nextLine()

    // Call the function to reverse the words in the string
    val reversedString = reverseWords(inputString)

    // Print the reversed string
    println("Reversed string: $reversedString")
}

/**
 * This function takes a string as input and returns a new string
 * with the words in reverse order.
 *
 * @param str The input string
 * @return The string with words in reverse order
 */
fun reverseWords(str: String): String {
    // Split the input string into words
    val words = str.split(" ")

    // Create a new list to hold the reversed words
    val reversedWords = mutableListOf<String>()

    // Iterate over the words in reverse order and add them to the new list
    for (i in words.indices.reversed()) {
        reversedWords.add(words[i])
    }

    // Join the reversed words into a single string
    val result = reversedWords.joinToString(" ")

    // Return the result
    return result
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
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val weather = "rainy"
    val temperature = 18
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * This function demonstrates using a variable for multiple purposes.
 */
fun multiPurposeVariable() {
    var weather = "cloudy"
    println("The weather is $weather.")
    weather = "stormy"
    println("The weather is now $weather.")
}

