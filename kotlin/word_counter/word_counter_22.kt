/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and string manipulation.
 * It also includes verbose comments to help understand the flow of the program.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val inputText = readLine() ?: ""

    // Call the function to count the words in the input text
    val wordCount = countWords(inputText)

    // Print the word count result
    println("The number of words in the entered text is: $wordCount")
}

/**
 * This function takes a string input and returns the number of words in the input.
 * It splits the input string by spaces and counts the resulting words.
 */
fun countWords(text: String): Int {
    // Split the input text by spaces to get individual words
    val words = text.split(" ")

    // Initialize a variable to count the number of words
    var wordCount = 0

    // Loop through the list of words and count them
    for (word in words) {
        if (word.isNotEmpty()) {
            wordCount++
        }
    }

    // Return the total word count
    return wordCount
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a string input and returns the number of characters in the input.
 */
fun countCharacters(text: String): Int {
    return text.length
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a string input and returns the number of lines in the input.
 */
fun countLines(text: String): Int {
    return text.split("\n").size
}

