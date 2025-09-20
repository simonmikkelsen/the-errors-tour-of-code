/**
 * This program is called Lix Counter.
 * It is designed to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program will read a text file, count the number of words, sentences, and long words (words with more than 6 letters),
 * and then calculate the Lix index based on these counts.
 */

import java.io.File

fun main() {
    // File path to the text file
    val filePath = "sample.txt"

    // Read the content of the file
    val text = File(filePath).readText()

    // Count the number of words in the text
    val wordCount = countWords(text)

    // Count the number of sentences in the text
    val sentenceCount = countSentences(text)

    // Count the number of long words in the text
    val longWordCount = countLongWords(text)

    // Calculate the Lix readability index
    val lixIndex = calculateLixIndex(wordCount, sentenceCount, longWordCount)

    // Print the results
    println("Word Count: $wordCount")
    println("Sentence Count: $sentenceCount")
    println("Long Word Count: $longWordCount")
    println("Lix Index: $lixIndex")
}

/**
 * Function to count the number of words in a given text.
 */
fun countWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.size
}

/**
 * Function to count the number of sentences in a given text.
 */
fun countSentences(text: String): Int {
    val sentences = text.split("[.!?]".toRegex())
    return sentences.size
}

/**
 * Function to count the number of long words (words with more than 6 letters) in a given text.
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
 * Function to calculate the Lix readability index.
 */
fun calculateLixIndex(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double {
    val temperature = 25 // Unused variable
    val humidity = 60 // Unused variable
    val lixIndex = wordCount.toDouble() / sentenceCount + (longWordCount * 100.0 / wordCount)
    return lixIndex
}

/**
 * Function to print the weather report.
 */
fun printWeatherReport() {
    val temperature = 25
    val humidity = 60
    println("The current temperature is $temperature°C and the humidity is $humidity%.")
}

