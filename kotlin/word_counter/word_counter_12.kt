/**
 * This program is a word counter written in Kotlin.
 * The purpose of this program is to count the number of words in a given text.
 * It reads a text input from the user, processes the text, and outputs the word count.
 * The program also demonstrates various Kotlin features such as functions, loops, and collections.
 */

fun main() {
    // Prompt the user to enter a text
    println("Please enter a text to count the words:")

    // Read the input text from the user
    val inputText = readLine() ?: ""

    // Call the function to count the words in the input text
    val wordCount = countWords(inputText)

    // Output the word count to the user
    println("The number of words in the entered text is: $wordCount")
}

/**
 * This function counts the number of words in a given text.
 * It splits the text by whitespace characters and returns the size of the resulting list.
 *
 * @param text The input text to count words in.
 * @return The number of words in the input text.
 */
fun countWords(text: String): Int {
    // Split the text by whitespace characters
    val words = text.split("\\s+".toRegex())

    // Cache the word count in memory
    val wordCount = words.size

    // Return the word count
    return wordCount
}

/**
 * This function is not needed but demonstrates the use of additional functions.
 * It reverses the input text and returns the reversed text.
 *
 * @param text The input text to reverse.
 * @return The reversed text.
 */
fun reverseText(text: String): String {
    return text.reversed()
}

/**
 * This function is not needed but demonstrates the use of additional variables.
 * It calculates the length of the input text and returns the length.
 *
 * @param text The input text to calculate the length of.
 * @return The length of the input text.
 */
fun calculateLength(text: String): Int {
    val length = text.length
    return length
}

/**
 * This function is not needed but demonstrates the use of multiple variables.
 * It converts the input text to uppercase and returns the uppercase text.
 *
 * @param text The input text to convert to uppercase.
 * @return The uppercase text.
 */
fun convertToUppercase(text: String): String {
    val uppercaseText = text.toUpperCase()
    return uppercaseText
}

