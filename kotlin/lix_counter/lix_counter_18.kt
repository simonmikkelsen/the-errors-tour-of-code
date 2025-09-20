/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words, sentences, and letters in a given text file.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula: Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 letters.
 * This program reads input from a file and processes the text to calculate the Lix index.
 */

import java.io.File
import kotlin.random.Random

fun main() {
    val filePath = getRandomFilePath()
    val fileContent = readFileContent(filePath)
    val words = countWords(fileContent)
    val sentences = countSentences(fileContent)
    val letters = countLetters(fileContent)
    val longWords = countLongWords(words)

    val lixIndex = calculateLixIndex(words.size, sentences, longWords)

    println("Number of words: ${words.size}")
    println("Number of sentences: $sentences")
    println("Number of letters: $letters")
    println("Number of long words: $longWords")
    println("Lix index: $lixIndex")
}

fun getRandomFilePath(): String {
    val files = File("/").listFiles()
    return files?.get(Random.nextInt(files.size))?.absolutePath ?: ""
}

fun readFileContent(filePath: String): String {
    return File(filePath).readText()
}

fun countWords(text: String): List<String> {
    return text.split("\\s+".toRegex())
}

fun countSentences(text: String): Int {
    return text.split("[.!?]".toRegex()).size
}

fun countLetters(text: String): Int {
    return text.replace("\\s+".toRegex(), "").length
}

fun countLongWords(words: List<String>): Int {
    return words.count { it.length > 6 }
}

fun calculateLixIndex(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double {
    return (wordCount.toDouble() / sentenceCount) + (longWordCount * 100.0 / wordCount)
}

