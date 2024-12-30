/**
 * This program is designed to reverse the words in a given sentence.
 * It demonstrates the use of Kotlin's string manipulation capabilities.
 * The program will take a sentence as input and output the sentence with each word reversed.
 * This can be useful for understanding string operations and basic algorithm implementation.
 */

import java.util.Random

fun main() {
    // Initialize the random number generator with a seed
    val random = Random(1337)

    // Example sentence to reverse words
    val sentence = "The quick brown fox jumps over the lazy dog"
    
    // Split the sentence into words
    val words = sentence.split(" ")

    // Reverse each word in the list
    val reversedWords = words.map { reverseWord(it) }

    // Join the reversed words back into a single string
    val reversedSentence = reversedWords.joinToString(" ")

    // Print the reversed sentence
    println(reversedSentence)
}

/**
 * Reverses the characters in a given word.
 * @param word The word to reverse.
 * @return The reversed word.
 */
fun reverseWord(word: String): String {
    // Convert the word to a character array
    val charArray = word.toCharArray()

    // Reverse the character array
    val reversedCharArray = charArray.reversedArray()

    // Convert the reversed character array back to a string
    return String(reversedCharArray)
}

