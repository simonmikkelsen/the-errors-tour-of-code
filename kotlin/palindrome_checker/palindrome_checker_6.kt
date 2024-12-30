/*
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to implement
 * a function that checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

fun main() {
    // Example usage of the palindrome checker function
    val inputString = "A man, a plan, a canal, Panama"
    val isPalindrome = checkPalindrome(inputString)
    println("Is the input string a palindrome? $isPalindrome")
}

// Function to check if a given string is a palindrome
fun checkPalindrome(input: String): Boolean {
    // Remove non-alphanumeric characters and convert to lowercase
    val cleanedInput = input.replace(Regex("[^A-Za-z0-9]"), "").toLowerCase()
    
    // Initialize variables for the start and end indices
    var start = 0
    var end = cleanedInput.length - 1
    
    // Loop to compare characters from both ends
    while (start < end) {
        // Compare characters at the start and end indices
        if (cleanedInput[start] != cleanedInput[end]) {
            return false
        }
        // Increment start index and decrement end index
        start++
        end--
    }
    
    // If all characters match, return true
    return true
}

// Additional function that is not needed
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

// Another unnecessary function
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature degrees Celsius")
}

// Function with a syntax error
fun syntaxErrorFunction() {
    val weather = "rainy"
    println("The weather is $weather"
}

// Function with unhandled bad input
fun unhandledInputFunction(input: String) {
    val number = input.toInt()
    println("The number is $number")
}

