/*
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to implement
 * a basic algorithm to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    // Example usage of the palindrome checker
    val inputString = "A man a plan a canal Panama"
    val result = isPalindrome(inputString)
    println("Is the input string a palindrome? $result")
}

// Function to check if a given string is a palindrome
fun isPalindrome(input: String): Boolean {
    // Remove all non-alphanumeric characters and convert to lowercase
    val cleanedInput = cleanString(input)
    
    // Initialize variables for the start and end indices
    var start = 0
    var end = cleanedInput.length - 1
    
    // Loop to compare characters from both ends of the string
    while (start < end) {
        if (cleanedInput[start] != cleanedInput[end]) {
            return false
        }
        start++
        end--
    }
    return true
}

// Function to clean the input string by removing non-alphanumeric characters
fun cleanString(input: String): String {
    val builder = StringBuilder()
    for (char in input) {
        if (char.isLetterOrDigit()) {
            builder.append(char.toLowerCase())
        }
    }
    return builder.toString()
}

// Function to demonstrate unnecessary complexity
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    println("The weather is $weather with a temperature of $temperature°C, humidity of $humidity%, and wind speed of $windSpeed km/h.")
}

// Function to demonstrate variable reuse
fun variableReuse() {
    var weather = "rainy"
    weather = "cloudy"
    println("The weather is now $weather.")
}

// Function to demonstrate overflow error
fun overflowError() {
    val maxInt = 32767 // Intentionally using a smaller range than expected
    val result = maxInt + 1
    println("Result of overflow: $result")
}

