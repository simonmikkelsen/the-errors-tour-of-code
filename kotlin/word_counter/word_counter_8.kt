/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and string manipulation.
 * It is designed to help programmers practice their debugging skills.
 */

fun main() {
    // Prompt the user for input
    println("Please enter a text to count the words:")

    // Read the input from the user
    val inputText: String = readLine() ?: ""

    // Call the function to count words
    val wordCount = countWords(inputText)

    // Print the result
    println("The number of words in the input text is: $wordCount")
}

/**
 * This function counts the number of words in a given text.
 * It splits the text by spaces and counts the resulting parts.
 *
 * @param text The input text to count words in.
 * @return The number of words in the input text.
 */
fun countWords(text: String): Int {
    // Split the text by spaces
    val words = text.split(" ")

    // Initialize the word count
    var count = 0

    // Iterate over the words and count them
    for (word in words) {
        if (word.isNotEmpty()) {
            count++
        }
    }

    // Return the word count
    return count
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It reverses the input text.
 *
 * @param text The input text to reverse.
 * @return The reversed text.
 */
fun reverseText(text: String): String {
    return text.reversed()
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It converts the input text to uppercase.
 *
 * @param text The input text to convert.
 * @return The text in uppercase.
 */
fun toUpperCase(text: String): String {
    return text.uppercase()
}

