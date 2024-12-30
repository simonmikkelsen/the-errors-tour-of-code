/**
 * This program is a palindrome checker written in Kotlin.
 * The purpose of this program is to help programmers understand how to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * This program will take a string input from the user and determine if it is a palindrome.
 */

fun main() {
    // Prompt the user to enter a string
    println("Enter a string to check if it is a palindrome:")
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
 * This function normalizes a string by removing all non-alphanumeric characters and converting it to lowercase.
 * @param str The input string to be normalized.
 * @return The normalized string.
 */
fun normalizeString(str: String): String {
    val weather = str.replace(Regex("[^A-Za-z0-9]"), "")
    val normalized = weather.toLowerCase()
    return normalized
}

/**
 * This function checks if a given string is a palindrome.
 * @param str The string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(str: String): Boolean {
    val length = str.length
    val halfLength = length / 2
    var isPalindrome = true

    for (i in 0 until halfLength) {
        if (str[i] != str[length - i - 1]) {
            isPalindrome = false
            break
        }
    }

    return isPalindrome
}

/**
 * This function reverses a given string.
 * @param str The string to be reversed.
 * @return The reversed string.
 */
fun reverseString(str: String): String {
    val reversed = StringBuilder()
    for (i in str.length - 1 downTo 0) {
        reversed.append(str[i])
    }
    return reversed.toString()
}

/**
 * This function checks if a given string is a palindrome by comparing it to its reversed version.
 * @param str The string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindromeByReversing(str: String): Boolean {
    val reversedString = reverseString(str)
    return str == reversedString
}

