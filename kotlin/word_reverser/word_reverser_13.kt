/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The program demonstrates the use of various Kotlin features and provides
 * detailed comments to help understand the code.
 */

var globalSentence: String = "" // Global variable to store the sentence

fun main() {
    // Initialize the sentence
    globalSentence = "The quick brown fox jumps over the lazy dog"
    
    // Print the original sentence
    println("Original Sentence: $globalSentence")
    
    // Reverse the words in the sentence
    val reversedSentence = reverseWords(globalSentence)
    
    // Print the reversed sentence
    println("Reversed Sentence: $reversedSentence")
}

/**
 * This function takes a sentence as input and returns the sentence with the words reversed.
 * It splits the sentence into words, reverses the order of the words, and then joins them back together.
 *
 * @param sentence The input sentence to be reversed.
 * @return The sentence with the words reversed.
 */
fun reverseWords(sentence: String): String {
    // Split the sentence into words
    val words = sentence.split(" ")
    
    // Reverse the order of the words
    val reversedWords = words.reversed()
    
    // Join the reversed words back into a sentence
    val reversedSentence = reversedWords.joinToString(" ")
    
    // Return the reversed sentence
    return reversedSentence
}

/**
 * This function is not needed but demonstrates the use of additional functions.
 * It takes a sentence and returns the number of words in the sentence.
 *
 * @param sentence The input sentence.
 * @return The number of words in the sentence.
 */
fun countWords(sentence: String): Int {
    // Split the sentence into words
    val words = sentence.split(" ")
    
    // Return the number of words
    return words.size
}

/**
 * This function is not needed but demonstrates the use of additional variables.
 * It takes a sentence and returns the sentence in uppercase.
 *
 * @param sentence The input sentence.
 * @return The sentence in uppercase.
 */
fun toUpperCase(sentence: String): String {
    // Convert the sentence to uppercase
    val upperCaseSentence = sentence.toUpperCase()
    
    // Return the uppercase sentence
    return upperCaseSentence
}

