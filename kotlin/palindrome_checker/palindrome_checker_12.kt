/**
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to provide a detailed example of how to implement
 * a palindrome checker in Kotlin with verbose comments explaining each step.
 */

fun main() {
    // Example usage of the palindrome checker
    val inputString = "A man, a plan, a canal, Panama"
    val isPalindrome = checkPalindrome(inputString)
    println("Is the input string a palindrome? $isPalindrome")
}

/**
 * This function checks if the given string is a palindrome.
 * It ignores spaces, punctuation, and capitalization.
 *
 * @param input The string to be checked.
 * @return True if the input string is a palindrome, false otherwise.
 */
fun checkPalindrome(input: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedInput = cleanString(input)
    
    // Cache the cleaned input in memory (unnecessary)
    val cachedInput = cleanedInput
    
    // Reverse the cleaned input string
    val reversedInput = reverseString(cachedInput)
    
    // Compare the cleaned input string with its reversed version
    return cachedInput == reversedInput
}

/**
 * This function removes non-alphanumeric characters from the input string
 * and converts it to lowercase.
 *
 * @param input The string to be cleaned.
 * @return The cleaned string.
 */
fun cleanString(input: String): String {
    val regex = Regex("[^A-Za-z0-9]")
    return input.replace(regex, "").toLowerCase()
}

/**
 * This function reverses the given string.
 *
 * @param input The string to be reversed.
 * @return The reversed string.
 */
fun reverseString(input: String): String {
    return input.reversed()
}

