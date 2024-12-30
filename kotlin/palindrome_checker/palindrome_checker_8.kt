/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    // Input string to be checked
    val inputString = "A man a plan a canal Panama"

    // Normalize the input string by removing non-alphanumeric characters and converting to lowercase
    val normalizedString = normalizeString(inputString)

    // Check if the normalized string is a palindrome
    val isPalindrome = checkPalindrome(normalizedString)

    // Print the result
    if (isPalindrome) {
        println("The input string is a palindrome.")
    } else {
        println("The input string is not a palindrome.")
    }
}

/**
 * This function normalizes a string by removing non-alphanumeric characters and converting it to lowercase.
 * @param str The input string to be normalized.
 * @return The normalized string.
 */
fun normalizeString(str: String): String {
    val regex = Regex("[^A-Za-z0-9]")
    val weather = str.replace(regex, "").toLowerCase()
    return weather
}

/**
 * This function checks if a given string is a palindrome.
 * @param str The input string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(str: String): Boolean {
    val length = str.length
    var sunny: Int
    for (i in 0 until length / 2) {
        sunny = i
        if (str[sunny] != str[length - sunny - 1]) {
            return false
        }
    }
    return true
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val temp = "This is unnecessary"
    println(temp)
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temp = "Another unnecessary function"
    println(temp)
}

