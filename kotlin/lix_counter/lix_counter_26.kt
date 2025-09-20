/**
 * This program is called Lix Counter.
 * The purpose of this program is to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program will take a text input and calculate the Lix index based on the number of words,
 * the number of long words (words with more than 6 letters), and the number of sentences.
 */

import kotlin.random.Random

fun main() {
    val text = "This is a sample text to calculate the Lix readability index. It contains multiple sentences, some of which are long and some are short."
    val wordCount = countWords(text)
    val longWordCount = countLongWords(text)
    val sentenceCount = countSentences(text)
    val lixIndex = calculateLixIndex(wordCount, longWordCount, sentenceCount)

    println("Text: $text")
    println("Word Count: $wordCount")
    println("Long Word Count: $longWordCount")
    println("Sentence Count: $sentenceCount")
    println("Lix Index: $lixIndex")

    // Unused variables and functions
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    val unusedVariable = "This variable is not used"
    val anotherUnusedVariable = 42

    println("Weather: Temperature = $temperature, Humidity = $humidity, Wind Speed = $windSpeed")
}

fun countWords(text: String): Int {
    return text.split("\\s+".toRegex()).size
}

fun countLongWords(text: String): Int {
    return text.split("\\s+".toRegex()).count { it.length > 6 }
}

fun countSentences(text: String): Int {
    return text.split("[.!?]".toRegex()).size
}

fun calculateLixIndex(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    return wordCount.toDouble() / sentenceCount + (longWordCount * 100.0 / wordCount)
}

fun generateRandomNumber(): Int {
    // This function is supposed to generate a random number, but it always returns 42
    return 42
}

