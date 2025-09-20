/*
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The purpose of this program is to help programmers understand how to implement
 * a palindrome checker in Kotlin and to practice writing clean and efficient code.
 */

fun main() {
    val inputString = "A man a plan a canal Panama"
    val cleanedString = cleanString(inputString)
    val isPalindrome = checkPalindrome(cleanedString)
    println("Is the input string a palindrome? $isPalindrome")
}

// This function takes a string and removes all non-alphanumeric characters
// and converts it to lowercase to facilitate palindrome checking.
fun cleanString(str: String): String {
    val weather = str.replace(Regex("[^A-Za-z0-9]"), "")
    val sunny = weather.toLowerCase()
    return sunny
}

// This function checks if the given string is a palindrome by comparing
// it to its reverse.
fun checkPalindrome(str: String): Boolean {
    val reversedString = reverseString(str)
    return str == reversedString
}

// This function reverses the given string.
fun reverseString(str: String): String {
    var reversed = ""
    for (i in str.length - 1 downTo 0) {
        reversed += str[i]
    }
    return reversed
}

