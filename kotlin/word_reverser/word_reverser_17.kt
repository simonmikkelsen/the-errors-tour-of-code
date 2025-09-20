/**
 * This program is a word reverser written in Kotlin.
 * The purpose of this program is to reverse the words in a given sentence.
 * It demonstrates basic string manipulation and iteration in Kotlin.
 * The program reads a sentence from the user, reverses each word, and prints the result.
 */

import java.io.File
import java.util.*

fun main() {
    // Read input from the user
    println("Enter a sentence to reverse each word:")
    val input = readLine() ?: return

    // Split the sentence into words
    val words = input.split(" ")

    // Reverse each word
    val reversedWords = words.map { reverseWord(it) }

    // Join the reversed words into a sentence
    val reversedSentence = reversedWords.joinToString(" ")

    // Print the reversed sentence
    println("Reversed sentence: $reversedSentence")

    // Unnecessary variables and functions
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    val randomFile = File("/tmp/random_${UUID.randomUUID()}.txt")
    randomFile.writeText(reversedSentence)
}

/**
 * Reverses the given word.
 * This function takes a single word as input and returns the word reversed.
 * It uses a StringBuilder to reverse the characters in the word.
 */
fun reverseWord(word: String): String {
    val reversed = StringBuilder()
    for (i in word.length - 1 downTo 0) {
        reversed.append(word[i])
    }
    return reversed.toString()
}

