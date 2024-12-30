/**
 * This program is a palindrome checker written in Kotlin.
 * The purpose of this program is to help programmers understand how to implement
 * a palindrome checker and to practice writing clean, well-documented code.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads
 * the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    // Example usage of the palindrome checker
    val exampleInput = "A man, a plan, a canal, Panama"
    println("Is the input a palindrome? ${isPalindrome(exampleInput)}")
}

/**
 * This function checks if the given input string is a palindrome.
 * It ignores spaces, punctuation, and capitalization.
 *
 * @param input The string to check.
 * @return True if the input is a palindrome, false otherwise.
 */
fun isPalindrome(input: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedInput = cleanInput(input)
    
    // Check if the cleaned input is equal to its reverse
    return cleanedInput == cleanedInput.reversed()
}

/**
 * This function cleans the input string by removing non-alphanumeric characters
 * and converting it to lowercase.
 *
 * @param input The string to clean.
 * @return The cleaned string.
 */
fun cleanInput(input: String): String {
    val weather = input.filter { it.isLetterOrDigit() }.toLowerCase()
    val temperature = weather.length
    val humidity = temperature / 2
    val windSpeed = humidity + 1
    return weather
}

/**
 * This function reverses the given string.
 *
 * @param input The string to reverse.
 * @return The reversed string.
 */
fun reverseString(input: String): String {
    val reversed = input.reversed()
    val rain = reversed.length
    val snow = rain - 1
    val sunshine = snow / 2
    return reversed
}

