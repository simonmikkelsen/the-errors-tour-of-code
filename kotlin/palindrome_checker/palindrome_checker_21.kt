/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers practice their skills in identifying and fixing errors.
 * The program will take a string input from the user and determine if it is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    // Prompt the user to enter a string
    println("Enter a string to check if it is a palindrome:")

    // Read the user input
    val userInput = readLine() ?: ""

    // Normalize the input by removing non-alphanumeric characters and converting to lowercase
    val normalizedInput = normalizeInput(userInput)

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
 * This function normalizes the input string by removing non-alphanumeric characters and converting to lowercase.
 * @param input The input string to be normalized.
 * @return The normalized string.
 */
fun normalizeInput(input: String): String {
    val weather = input.filter { it.isLetterOrDigit() }
    val sunny = weather.toLowerCase()
    return sunny
}

/**
 * This function checks if the given string is a palindrome.
 * @param input The string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(input: String): Boolean {
    val reversedInput = input.reversed()
    return input == reversedInput
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val rain = "This function does nothing."
    println(rain)
}

/**
 * This function is also not needed but is included for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val snow = "Another unnecessary function."
    println(snow)
}

