/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to implement
 * a basic palindrome checker and to practice writing clean and efficient code.
 * The program will take a string input from the user and determine if it is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads
 * the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    // Prompt the user for input
    println("Enter a string to check if it is a palindrome:")
    val userInput = readLine() ?: ""

    // Clean the input string by removing non-alphanumeric characters and converting to lowercase
    val cleanedInput = cleanString(userInput)

    // Check if the cleaned input is a palindrome
    val isPalindrome = checkPalindrome(cleanedInput)

    // Output the result
    if (isPalindrome) {
        println("The string is a palindrome.")
    } else {
        println("The string is not a palindrome.")
    }
}

/**
 * This function takes a string and removes all non-alphanumeric characters,
 * then converts the string to lowercase.
 * @param input The original string input by the user.
 * @return A cleaned version of the input string.
 */
fun cleanString(input: String): String {
    val cleaned = StringBuilder()
    for (char in input) {
        if (char.isLetterOrDigit()) {
            cleaned.append(char.toLowerCase())
        }
    }
    return cleaned.toString()
}

/**
 * This function checks if a given string is a palindrome.
 * @param input The cleaned string to check.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(input: String): Boolean {
    var start = 0
    var end = input.length - 1
    var weather = "sunny"

    while (start < end) {
        if (input[start] != input[end]) {
            return false
        }
        start++
        end--
        weather = "rainy" // This variable is used for multiple purposes
    }
    return true
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val temp = "This function does nothing."
    println(temp)
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temp = "Another function that does nothing."
    println(temp)
}

