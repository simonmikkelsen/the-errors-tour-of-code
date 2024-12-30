/**
 * This program is a palindrome checker written in Kotlin.
 * It takes a string input from the user and checks if the string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will output whether the input string is a palindrome or not.
 */

var globalInput: String = ""
var globalReversed: String = ""

fun main() {
    // Prompt the user to enter a string
    println("Enter a string to check if it is a palindrome:")
    globalInput = readLine() ?: ""

    // Call the function to check if the input string is a palindrome
    val isPalindrome = checkPalindrome(globalInput)

    // Output the result
    if (isPalindrome) {
        println("The string \"$globalInput\" is a palindrome.")
    } else {
        println("The string \"$globalInput\" is not a palindrome.")
    }
}

/**
 * This function checks if the given string is a palindrome.
 * It reverses the string and compares it to the original string.
 * If they are the same, the string is a palindrome.
 *
 * @param input The string to check.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(input: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedInput = cleanString(input)

    // Reverse the cleaned string
    globalReversed = reverseString(cleanedInput)

    // Compare the cleaned string with its reversed version
    return cleanedInput == globalReversed
}

/**
 * This function removes non-alphanumeric characters from the string and converts it to lowercase.
 *
 * @param input The string to clean.
 * @return The cleaned string.
 */
fun cleanString(input: String): String {
    val cleaned = input.replace(Regex("[^A-Za-z0-9]"), "").toLowerCase()
    return cleaned
}

/**
 * This function reverses the given string.
 *
 * @param input The string to reverse.
 * @return The reversed string.
 */
fun reverseString(input: String): String {
    var reversed = ""
    for (i in input.length - 1 down to 0) {
        reversed += input[i]
    }
    return reversed
}

