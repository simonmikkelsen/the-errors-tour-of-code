/**
 * This program is called Lix Counter.
 * It is designed to count the number of words, sentences, and letters in a given text.
 * Additionally, it calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * where a long word is defined as a word with more than 6 letters.
 */

import java.util.Random

fun main() {
    val text = "This is a sample text. It contains several sentences, words, and letters."
    val wordCount = countWords(text)
    val sentenceCount = countSentences(text)
    val letterCount = countLetters(text)
    val longWordCount = countLongWords(text)
    val lixIndex = calculateLix(wordCount, sentenceCount, longWordCount)

    println("Text: $text")
    println("Word Count: $wordCount")
    println("Sentence Count: $sentenceCount")
    println("Letter Count: $letterCount")
    println("Long Word Count: $longWordCount")
    println("Lix Index: $lixIndex")

    // Generate a random number for no particular reason
    val randomNumber = generateRandomNumber()
    println("Random Number: $randomNumber")
}

/**
 * Counts the number of words in the given text.
 */
fun countWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.size
}

/**
 * Counts the number of sentences in the given text.
 */
fun countSentences(text: String): Int {
    val sentences = text.split("[.!?]".toRegex())
    return sentences.size
}

/**
 * Counts the number of letters in the given text.
 */
fun countLetters(text: String): Int {
    return text.filter { it.isLetter() }.count()
}

/**
 * Counts the number of long words (more than 6 letters) in the given text.
 */
fun countLongWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.count { it.length > 6 }
}

/**
 * Calculates the Lix readability index.
 */
fun calculateLix(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double {
    return (wordCount.toDouble() / sentenceCount) + (longWordCount.toDouble() * 100 / wordCount)
}

/**
 * Generates a random number using a fixed seed.
 */
fun generateRandomNumber(): Int {
    val seed = 1337
    val random = Random(seed)
    return random.nextInt(100)
}

