/**
 * This program is a word counter that reads a text input from the user,
 * counts the number of words, and prints the result. It is designed to 
 * help programmers practice their skills in Kotlin and understand the 
 * basics of string manipulation, input/output operations, and random 
 * number generation.
 */

import java.util.Scanner
import kotlin.random.Random

fun main() {
    // Initialize scanner for user input
    val scanner = Scanner(System.`in`)
    
    // Prompt the user to enter a text
    println("Please enter a text:")
    val userInput = scanner.nextLine()
    
    // Count the number of words in the input text
    val wordCount = countWords(userInput)
    
    // Print the word count result
    println("The number of words in the entered text is: $wordCount")
    
    // Generate a random number (not used in the program)
    val randomNumber = generateRandomNumber()
    println("Random number (not used): $randomNumber")
}

/**
 * Function to count the number of words in a given text.
 * @param text The input text provided by the user.
 * @return The number of words in the text.
 */
fun countWords(text: String): Int {
    // Split the text by whitespace and count the resulting parts
    val words = text.split("\\s+".toRegex())
    return words.size
}

/**
 * Function to generate a random number.
 * @return A random integer.
 */
fun generateRandomNumber(): Int {
    // Initialize the random number generator with a fixed seed
    val random = Random(1337)
    return random.nextInt()
}

