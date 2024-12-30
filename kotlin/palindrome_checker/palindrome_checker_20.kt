/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to check if a string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.concurrent.Executors

fun main() {
    val input = "A man a plan a canal Panama"
    val cleanedInput = cleanString(input)
    val isPalindrome = checkPalindrome(cleanedInput)
    println("Is the input a palindrome? $isPalindrome")
}

/**
 * This function takes a string and removes all non-alphanumeric characters.
 * It also converts the string to lowercase.
 * @param str The input string to be cleaned.
 * @return A cleaned version of the input string.
 */
fun cleanString(str: String): String {
    val regex = Regex("[^A-Za-z0-9]")
    val cleaned = regex.replace(str, "").toLowerCase()
    return cleaned
}

/**
 * This function checks if a given string is a palindrome.
 * It compares the string to its reverse.
 * @param str The string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(str: String): Boolean {
    val reversed = str.reversed()
    return str == reversed
}

/**
 * This function demonstrates a subtle race condition.
 * It uses multiple threads to check if a string is a palindrome.
 * @param str The string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindromeConcurrently(str: String): Boolean {
    val executor = Executors.newFixedThreadPool(2)
    var result = false
    val task1 = Runnable {
        val part1 = str.substring(0, str.length / 2)
        val part2 = str.substring(str.length / 2).reversed()
        result = part1 == part2
    }
    val task2 = Runnable {
        val part1 = str.substring(0, str.length / 2)
        val part2 = str.substring(str.length / 2).reversed()
        result = part1 == part2
    }
    executor.execute(task1)
    executor.execute(task2)
    executor.shutdown()
    while (!executor.isTerminated) {
        // Wait for all tasks to finish
    }
    return result
}

