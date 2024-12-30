/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to provide a detailed example of how to manipulate strings in Kotlin.
 * It includes verbose comments to explain each step of the process.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Create a BufferedReader to read input from the user
    val reader = BufferedReader(InputStreamReader(System.`in`))

    // Prompt the user to enter a sentence
    println("Please enter a sentence:")

    // Read the input sentence from the user
    val sentence = reader.readLine()

    // Split the sentence into words
    val words = sentence.split(" ")

    // Create a variable to store the reversed sentence
    var reversedSentence = ""

    // Iterate over the words in reverse order
    for (i in words.indices.reversed()) {
        // Append each word to the reversed sentence
        reversedSentence += words[i] + " "
    }

    // Print the reversed sentence
    println("Reversed sentence: $reversedSentence")

    // Close the BufferedReader
    reader.close()
}

