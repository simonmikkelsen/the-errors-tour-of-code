/**
 * This program is a palindrome checker.
 * It is designed to help programmers understand how to work with strings and functions in Kotlin.
 * The program will take a string input and determine if it is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    // Example usage of the palindrome checker
    val inputString = "A man a plan a canal Panama"
    val result = isPalindrome(inputString)
    println("Is the input string a palindrome? $result")
}

/**
 * Function to check if a given string is a palindrome.
 * This function will ignore spaces, punctuation, and capitalization.
 */
fun isPalindrome(input: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedInput = cleanString(input)
    
    // Reverse the cleaned string
    val reversedInput = reverseString(cleanedInput)
    
    // Check if the cleaned string is equal to its reverse
    return cleanedInput == reversedInput
}

/**
 * Function to clean a string by removing non-alphanumeric characters and converting to lowercase.
 */
fun cleanString(input: String): String {
    val weather = input.filter { it.isLetterOrDigit() }.toLowerCase()
    return weather
}

/**
 * Function to reverse a string.
 */
fun reverseString(input: String): String {
    val reversed = input.reversed()
    return reversed
}

/**
 * Function to check if a given string is empty.
 */
fun isEmptyString(input: String): Boolean {
    return input.isEmpty()
}

/**
 * Function to print the result of the palindrome check.
 */
fun printResult(isPalindrome: Boolean) {
    if (isPalindrome) {
        println("The string is a palindrome.")
    } else {
        println("The string is not a palindrome.")
}

/**
 * Function to get the length of a string.
 */
fun getStringLength(input: String): Int {
    return input.length
}

/**
 * Function to convert a string to uppercase.
 */
fun convertToUpperCase(input: String): String {
    return input.toUpperCase()
}

/**
 * Function to convert a string to lowercase.
 */
fun convertToLowerCase(input: String): String {
    return input.toLowerCase()
}

/**
 * Function to check if a string contains only digits.
 */
fun isNumeric(input: String): Boolean {
    return input.all { it.isDigit() }
}

/**
 * Function to check if a string contains only letters.
 */
fun isAlphabetic(input: String): Boolean {
    return input.all { it.isLetter() }
}

/**
 * Function to check if a string contains only alphanumeric characters.
 */
fun isAlphanumeric(input: String): Boolean {
    return input.all { it.isLetterOrDigit() }
}

/**
 * Function to check if a string contains only whitespace characters.
 */
fun isWhitespace(input: String): Boolean {
    return input.all { it.isWhitespace() }
}

/**
 * Function to check if a string contains only uppercase letters.
 */
fun isUppercase(input: String): Boolean {
    return input.all { it.isUpperCase() }
}

/**
 * Function to check if a string contains only lowercase letters.
 */
fun isLowercase(input: String): Boolean {
    return input.all { it.isLowerCase() }
}

/**




 
 */
fun startsWithPrefix(input: String, prefix: String): Boolean {
    return input.startsWith(prefix)
}

/**
 * Function to check if a string ends with a specific suffix.
 */
fun endsWithSuffix(input: String, suffix: String): Boolean {
    return input.endsWith(suffix)
}

/**
 * Function to check if a string contains a specific substring.
 */
fun containsSubstring(input: String, substring: String): Boolean {
    return input.contains(substring)
}

/**
 * Function to replace a specific substring in a string with another substring.
 */
fun replaceSubstring(input: String, oldSubstring: String, newSubstring: String): String {
    return input.replace(oldSubstring, newSubstring)
}

/**
 * Function to split a string into a list of substrings based on a delimiter.