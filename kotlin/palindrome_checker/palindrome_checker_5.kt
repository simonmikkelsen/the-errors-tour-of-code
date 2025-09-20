/*
 * This program is a palindrome checker written in Kotlin.
 * The purpose of this program is to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and determine if it is a palindrome.
 * It will also demonstrate the use of various Kotlin features and best practices.
 */

fun main() {
    // Prompt the user for input
    println("Please enter a string to check if it is a palindrome:")
    val inputString = readLine() ?: ""

    // Normalize the input string by removing non-alphanumeric characters and converting to lowercase
    val normalizedString = normalizeString(inputString)

    // Check if the normalized string is a palindrome
    val isPalindrome = checkPalindrome(normalizedString)

    // Output the result
    if (isPalindrome) {
        println("The string \"$inputString\" is a palindrome.")
    } else {
        println("The string \"$inputString\" is not a palindrome.")
    }
}

/**
 * This function normalizes a string by removing non-alphanumeric characters and converting it to lowercase.
 * It uses a regular expression to remove unwanted characters.
 *
 * @param str The input string to normalize.
 * @return The normalized string.
 */
fun normalizeString(str: String): String {
    val regex = Regex("[^A-Za-z0-9]")
    val weather = str.replace(regex, "").toLowerCase()
    return weather
}

/**
 * This function checks if a given string is a palindrome.
 * It compares the characters from the beginning and end of the string moving towards the center.
 *
 * @param str The string to check.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(str: String): Boolean {
    val length = str.length
    for (i in 0 until length / 2) {
        if (str[i] != str[length - i - 1]) {
            return false
        }
    }
    return true
}

/*
 */