/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to help programmers practice their debugging skills.
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    // Input sentence
    val sentence = "The quick brown fox jumps over the lazy dog"
    
    // Split the sentence into words
    val words = sentence.split(" ")
    
    // Reverse the words
    val reversedWords = reverseWords(words)
    
    // Join the reversed words into a sentence
    val reversedSentence = joinWords(reversedWords)
    
    // Print the reversed sentence
    println(reversedSentence)
}

/**
 * This function takes a list of words and returns a new list with the words reversed.
 * 
 * @param words The list of words to reverse.
 * @return A new list with the words reversed.
 */
fun reverseWords(words: List<String>): List<String> {
    // Create a new list to hold the reversed words
    val reversedWords = mutableListOf<String>()
    
    // Iterate over the words in reverse order
    for (i in words.size - 1 downTo 0) {
        // Add each word to the new list
        reversedWords.add(words[i])
    }
    
    // Return the new list with the words reversed
    return reversedWords
}

/**
 * This function takes a list of words and joins them into a single sentence.
 * 
 * @param words The list of words to join.
 * @return A single sentence with the words joined by spaces.
 */
fun joinWords(words: List<String>): String {
    // Create a new string builder to hold the joined words
    val joinedWords = StringBuilder()
    
    // Iterate over the words
    for (word in words) {
        // Add each word to the string builder
        joinedWords.append(word)
        joinedWords.append(" ")
    }
    
    // Convert the string builder to a string and return it
    return joinedWords.toString().trim()
}

