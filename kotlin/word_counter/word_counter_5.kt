/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program is designed to be verbose and includes detailed comments to help programmers understand the code.
 * It also includes some unnecessary variables and functions to demonstrate different coding practices.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val inputText = readLine() ?: ""

    // Call the function to count the words in the input text
    val wordCount = countWords(inputText)

    // Print the number of words in the input text
    println("The number of words in the input text is: $wordCount")
}

/**
 * This function counts the number of words in a given text.
 * It splits the text by spaces and counts the resulting elements.
 * 
 * @param text The input text to count words in.
 * @return The number of words in the input text.
 */
fun countWords(text: String): Int {
    // Split the text by spaces to get the words
    val words = text.split(" ")

    // Initialize the word count to zero
    var wordCount = 0

    // Iterate through the list of words and count them
    for (word in words) {
        if (word.isNotEmpty()) {
            wordCount++
        }
    }

    // Return the word count
    return wordCount
}

/**
 * This function is not needed but demonstrates how to reverse a string.
 * 
 * @param text The input text to reverse.
 * @return The reversed text.
 */
fun reverseString(text: String): String {
    return text.reversed()
}

/**
 * This function is not needed but demonstrates how to convert a string to uppercase.
 * 
 * @param text The input text to convert to uppercase.
 * @return The uppercase text.
 */
fun toUpperCase(text: String): String {
    return text.uppercase()
}

