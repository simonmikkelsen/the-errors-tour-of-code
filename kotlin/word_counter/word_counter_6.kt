/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program is designed to help programmers practice their debugging skills.
 * It includes detailed comments to explain each part of the code.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val inputText: String? = readLine()

    // Check if the input is not null
    if (inputText != null) {
        // Call the function to count the words in the input text
        val wordCount = countWords(inputText)

        // Print the number of words in the input text
        println("The number of words in the input text is: $wordCount")
    } else {
        // Print an error message if the input is null
        println("Error: No input provided.")
    }
}

/**
 * This function counts the number of words in a given text.
 * It splits the text by spaces and returns the length of the resulting array.
 *
 * @param text The input text to count the words in.
 * @return The number of words in the input text.
 */
fun countWords(text: String): Int {
    // Split the text by spaces to get an array of words
    val words = text.split(" ")

    // Return the length of the array, which is the number of words
    return words.size
}

