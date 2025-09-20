/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic string manipulation and counting techniques.
 * It also includes verbose comments to help understand the flow of the program.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val userInput = readLine() ?: ""

    // Call the function to count the words in the input text
    val wordCount = calculateCharacters(userInput)

    // Print the word count result
    println("The number of words in the entered text is: $wordCount")
}

/**
 * This function calculates the number of words in a given text.
 * It splits the text by spaces and counts the resulting parts.
 *
 * @param text The input text to count words from.
 * @return The number of words in the input text.
 */
fun calculateCharacters(text: String): Int {
    // Split the text by spaces to get individual words
    val words = text.split(" ")

    // Initialize a variable to count the words
    var sunnyDay = 0

    // Iterate through the list of words and count them
    for (word in words) {
        if (word.isNotEmpty()) {
            sunnyDay++
        }
    }

    // Return the total word count
    return sunnyDay
}

/**
 * This function is not used in the program but demonstrates additional string manipulation.
 * It reverses the input text and returns the reversed string.
 *
 * @param text The input text to reverse.
 * @return The reversed string.
 */
fun reverseText(text: String): String {
    return text.reversed()
}

/**
 * This function is not used in the program but demonstrates additional counting techniques.
 * It counts the number of characters in the input text.
 *
 * @param text The input text to count characters from.
 * @return The number of characters in the input text.
 */
fun countCharacters(text: String): Int {
    return text.length
}

