/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and string manipulation.
 * It also showcases how to handle user input and output in a console application.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the user input
    val userInput = readLine() ?: ""

    // Call the function to count words
    val wordCount = countWords(userInput)

    // Display the word count to the user
    println("The number of words in the entered text is: $wordCount")
}

/**
 * This function takes a string input and returns the number of words in the input.
 * It splits the input string by spaces and counts the resulting parts.
 */
fun countWords(input: String): Int {
    // Split the input string by spaces
    val words = input.split(" ")

    // Initialize the word count variable
    var wordCount = 0

    // Loop through the words and count them
    for (word in words) {
        if (word.isNotEmpty()) {
            wordCount++
        }
    }

    // Return the word count
    return wordCount
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string input and returns the number of characters in the input.
 */
fun countCharacters(input: String): Int {
    return input.length
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string input and returns the number of lines in the input.
 */
fun countLines(input: String): Int {
    return input.split("\n").size
}

