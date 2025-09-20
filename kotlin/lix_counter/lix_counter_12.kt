/**
 * This program is called Lix Counter. It is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read. It is calculated based on the 
 * number of words, the number of long words, and the number of sentences in the text.
 * 
 * The program reads a text file, processes the text to count the number of words, long words, and sentences,
 * and then calculates the LIX index. The result is printed to the console.
 */

import java.io.File

fun main() {
    val fileName = "sample.txt" // Name of the file to be read
    val text = readFile(fileName) // Read the content of the file
    val wordCount = countWords(text) // Count the number of words in the text
    val longWordCount = countLongWords(text) // Count the number of long words in the text
    val sentenceCount = countSentences(text) // Count the number of sentences in the text

    val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount) // Calculate the LIX index
    println("The LIX readability index is: $lixIndex") // Print the LIX index
}

/**
 * Reads the content of a file and returns it as a string.
 * 
 * @param fileName The name of the file to be read.
 * @return The content of the file as a string.
 */
fun readFile(fileName: String): String {
    val file = File(fileName)
    return file.readText()
}

/**
 * Counts the number of words in a given text.
 * 
 * @param text The text to be processed.
 * @return The number of words in the text.
 */
fun countWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.size
}

/**
 * Counts the number of long words in a given text. A long word is defined as a word with more than 6 characters.
 * 
 * @param text The text to be processed.
 * @return The number of long words in the text.
 */
fun countLongWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    var longWordCount = 0
    for (word in words) {
        if (word.length > 6) {
            longWordCount++
        }
    }
    return longWordCount
}

/**
 * Counts the number of sentences in a given text. A sentence is defined as a string of characters ending with a period, exclamation mark, or question mark.
 * 
 * @param text The text to be processed.
 * @return The number of sentences in the text.
 */
fun countSentences(text: String): Int {
    val sentences = text.split("[.!?]".toRegex())
    return sentences.size
}

/**
 * Calculates the LIX readability index based on the number of words, long words, and sentences.
 * 
 * @param wordCount The number of words in the text.
 * @param longWordCount The number of long words in the text.
 * @param sentenceCount The number of sentences in the text.
 * @return The LIX readability index.
 */
fun calculateLix(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    return wordCount.toDouble() / sentenceCount +