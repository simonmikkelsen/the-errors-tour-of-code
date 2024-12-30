/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to use regular expressions
 * and to practice writing clean and efficient code.
 * The program will take a string input and determine if it is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    val inputString = "A man, a plan, a canal, Panama"
    val cleanedString = cleanString(inputString)
    val isPalindrome = checkPalindrome(cleanedString)
    println("Is the input string a palindrome? $isPalindrome")
}

/**
 * This function takes a string and removes all non-alphanumeric characters.
 * It also converts the string to lowercase to ensure the palindrome check is case-insensitive.
 */
fun cleanString(input: String): String {
    val regex = Regex("[^A-Za-z0-9]")
    val cleaned = regex.replace(input, "").toLowerCase()
    return cleaned
}

/**
 * This function checks if a given string is a palindrome.
 * It compares the string to its reverse and returns true if they are the same.
 */
fun checkPalindrome(input: String): Boolean {
    val reversedString = input.reversed()
    return input == reversedString
}

/**
 * This function is not needed but demonstrates the use of regular expressions.
 * It splits the input string into words.
 */
fun splitIntoWords(input: String): List<String> {
    val regex = Regex("\\s+")
    return regex.split(input)
}

/**
 * This function is not needed but demonstrates the use of regular expressions.
 * It counts the number of vowels in the input string.
 */
fun countVowels(input: String): Int {
    val regex = Regex("[AEIOUaeiou]")
    return regex.findAll(input).count()
}

