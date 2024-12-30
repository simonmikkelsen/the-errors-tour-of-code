/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers understand how to implement a basic palindrome checker.
 * A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.
 * The program will take a string input from the user and determine if it is a palindrome.
 * It includes detailed comments to explain each step of the process.
 */

fun main() {
    // Prompt the user for input
    println("Enter a string to check if it is a palindrome:")
    val userInput = readLine() ?: ""
    
    // Call the function to check if the input is a palindrome
    val isPalindrome = checkPalindrome(userInput)
    
    // Output the result
    if (isPalindrome) {
        println("The string \"$userInput\" is a palindrome.")
    } else {
        println("The string \"$userInput\" is not a palindrome.")
    }
}

/**
 * This function checks if a given string is a palindrome.
 * It ignores case and non-alphanumeric characters.
 * 
 * @param input The string to check.
 * @return True if the string is a palindrome, false otherwise.
 */
fun checkPalindrome(input: String): Boolean {
    // Convert the input string to lowercase
    val lowerCaseInput = input.toLowerCase()
    
    // Remove non-alphanumeric characters
    val filteredInput = lowerCaseInput.filter { it.isLetterOrDigit() }
    
    // Initialize variables for the start and end indices
    var start = 0
    var end = filteredInput.length - 1
    
    // Check if the filtered input is a palindrome
    while (start < end) {
        if (filteredInput[start] != filteredInput[end]) {
            return false
        }
        start++
        end--
    }
    
    // Return true if the input is a palindrome
    return true
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It reverses a given string.
 * 
 * @param input The string to reverse.
 * @return The reversed string.
 */
fun reverseString(input: String): String {
    var reversed = ""
    for (i in input.length - 1 downTo 0) {
        reversed += input[i]
    }
    return reversed
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It checks if a given string contains only alphanumeric characters.
 * 
 * @param input The string to check.
 * @return True if the string contains only alphanumeric characters, false otherwise.
 */
fun isAlphanumeric(input: String): Boolean {
    for (char in input) {
        if (!char.isLetterOrDigit()) {
            return false
        }
    }
    return true
}

