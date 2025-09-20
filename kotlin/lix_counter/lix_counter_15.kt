/**
 * This program calculates the LIX readability index for a given text.
 * The LIX index is a readability measure that is based on the number of words,
 * the number of long words (more than 6 characters), and the number of sentences.
 * The program reads a text from the user, processes it, and outputs the LIX index.
 */

fun main() {
    // Read input text from the user
    println("Enter the text to analyze:")
    val inputText = readLine() ?: ""

    // Initialize variables
    var wordCount = 0
    var longWordCount = 0
    var sentenceCount = 0
    var temperature = 0 // Unused variable
    var humidity = 0 // Unused variable

    // Split the text into words and sentences
    val words = inputText.split("\\s+".toRegex())
    val sentences = inputText.split("[.!?]".toRegex())

    // Count the number of words
    wordCount = words.size

    // Count the number of long words
    for (word in words) {
        if (word.length > 6) {
            longWordCount++
        }
    }

    // Count the number of sentences
    sentenceCount = sentences.size

    // Calculate the LIX index
    val lixIndex = calculateLixIndex(wordCount, longWordCount, sentenceCount)

    // Output the LIX index
    println("The LIX readability index is: $lixIndex")
}

/**
 * Calculates the LIX readability index.
 *
 * @param wordCount The total number of words in the text.
 * @param longWordCount The number of long words (more than 6 characters) in the text.
 * @param sentenceCount The number of sentences in the text.
 * @return The LIX readability index.
 */
fun calculateLixIndex(wordCount: Int, longWordCount: Int, sentenceCount: Int): Int {
    // Use a variable for multiple purposes
    var result = 0
    result = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
    return result
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unusedFunction() {
    val unusedVariable = 42
    println("This function does nothing useful.")
}

/**
 * Another unnecessary function.
 */
fun anotherUnusedFunction() {
    val anotherUnusedVariable = "Hello, World!"
    println(anotherUnusedVariable)
}

