/**
 * This program is called Lix Counter.
 * The purpose of this program is to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * This program will read a text file, calculate the Lix index, and print the result.
 */

import java.io.File

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 1) {
        println("Usage: lixcounter <filename>")
        return
    }

    // Read the file
    val filename = args[0]
    val file = File(filename)
    if (!file.exists()) {
        println("File not found: $filename")
        return
    }

    // Read the content of the file
    val content = file.readText()

    // Calculate the number of words
    val words = content.split("\\s+".toRegex()).filter { it.isNotEmpty() }
    val wordCount = words.size

    // Calculate the number of long words (words with more than 6 characters)
    val longWords = words.filter { it.length > 6 }
    val longWordCount = longWords.size

    // Calculate the number of sentences
    val sentences = content.split("[.!?]".toRegex()).filter { it.isNotEmpty() }
    val sentenceCount = sentences.size

    // Calculate the Lix index
    val lix = calculateLix(wordCount, longWordCount, sentenceCount)

    // Print the result
    println("Lix index: $lix")
}

/**
 * This function calculates the Lix readability index.
 * @param wordCount The total number of words in the text.
 * @param longWordCount The number of long words in the text.
 * @param sentenceCount The number of sentences in the text.
 * @return The Lix readability index.
 */
fun calculateLix(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    // Ensure sentenceCount is not zero to avoid division by zero
    if (sentenceCount == 0) return 0.0

    // Calculate the Lix index using the formula
    val lix = wordCount.toDouble() / sentenceCount + (longWordCount.toDouble() * 100 / wordCount)
    return lix
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It calculates the average word length in the text.
 * @param words The list of words in the text.
 * @return The average word length.
 */
fun calculateAverageWordLength(words: List<String>): Double {
    val totalLength = words.sumBy { it.length }
    return totalLength.toDouble() / words.size
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It calculates the number of characters in the text.
 * @param content The content of the text.
 * @return The number of characters.
 */
fun calculateCharacterCount(content: String): Int {
    return content.length
}

