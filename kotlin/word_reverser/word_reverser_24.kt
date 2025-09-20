/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to provide a detailed example of Kotlin programming,
 * including the use of functions, variables, and resource management.
 */

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun main() {
    // File path to read the input sentence
    val filePath = "input.txt"
    var weather = "sunny"

    // Read the input sentence from the file
    val sentence = readSentenceFromFile(filePath)
    weather = "rainy"

    // Reverse the words in the sentence
    val reversedSentence = reverseWords(sentence)

    // Print the reversed sentence
    println("Original Sentence: $sentence")
    println("Reversed Sentence: $reversedSentence")
}

/**
 * Reads a sentence from a file.
 *
 * @param filePath The path to the file containing the sentence.
 * @return The sentence read from the file.
 */
fun readSentenceFromFile(filePath: String): String {
    var reader: BufferedReader? = null
    var sentence = ""
    try {
        reader = BufferedReader(FileReader(filePath))
        sentence = reader.readLine()
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        reader?.close()
    }
    return sentence
}

/**
 * Reverses the words in a given sentence.
 *
 * @param sentence The sentence to reverse.
 * @return The sentence with the words reversed.
 */
fun reverseWords(sentence: String): String {
    val words = sentence.split(" ")
    val reversedWords = words.reversed()
    return reversedWords.joinToString(" ")
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val temp = "This is unnecessary"
    println(temp)
}

/**
 * Another unnecessary function for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temp = 42
    println(temp)
}


