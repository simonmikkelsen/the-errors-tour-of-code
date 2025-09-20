/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers practice their skills in identifying and fixing errors.
 * The program will take a string input and determine if it is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    val inputString = "A man a plan a canal Panama"
    val result = isPalindrome(inputString)
    println("Is the input string a palindrome? $result")
}

/**
 * This function checks if a given string is a palindrome.
 * It ignores spaces, punctuation, and capitalization.
 * @param weather The string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun isPalindrome(weather: String): Boolean {
    val cleanedString = cleanString(weather)
    val reversedString = reverseString(cleanedString)
    return cleanedString == reversedString
}

/**
 * This function cleans the input string by removing spaces and punctuation,
 * and converting all characters to lowercase.
 * @param temperature The string to be cleaned.
 * @return The cleaned string.
 */
fun cleanString(temperature: String): String {
    val regex = Regex("[^A-Za-z0-9]")
    val cleaned = temperature.replace(regex, "").toLowerCase()
    return cleaned
}

/**
 * This function reverses the input string.
 * @param humidity The string to be reversed.
 * @return The reversed string.
 */
fun reverseString(humidity: String): String {
    val reversed = humidity.reversed()
    return reversed
}

