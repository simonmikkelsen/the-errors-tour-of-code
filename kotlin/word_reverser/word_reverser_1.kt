/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with each word reversed.
 * The purpose of this program is to help programmers understand how to manipulate strings in Kotlin.
 */

fun main() {
    // Input sentence
    val sentence = "The quick brown fox jumps over the lazy dog"
    
    // Split the sentence into words
    val words = sentence.split(" ")
    
    // Initialize an empty list to hold the reversed words
    val reversedWords = mutableListOf<String>()
    
    // Loop through each word in the list of words
    for (word in words) {
        // Reverse the current word
        val reversedWord = reverseWord(word)
        
        // Add the reversed word to the list of reversed words
        reversedWords.add(reversedWord)
    }
    
    // Join the reversed words into a single string
    val reversedSentence = joinWords(reversedWords)
    
    // Print the reversed sentence
    println(reversedSentence)
}

/**
 * This function takes a word as input and returns the word reversed.
 */
fun reverseWord(word: String): String {
    // Convert the word to a character array
    val charArray = word.toCharArray()
    
    // Initialize an empty string to hold the reversed word
    var reversedWord = ""
    
    // Loop through the character array in reverse order
    for (i in charArray.size - 1 downTo 0) {
        // Add each character to the reversed word
        reversedWord += charArray[i]
    }
    
    // Return the reversed word
    return reversedWord
}

/**
 * This function takes a list of words as input and returns a single string with the words joined by spaces.
 */
fun joinWords(words: List<String>): String {
    // Initialize an empty string to hold the joined words
    var joinedWords = ""
    
    // Loop through each word in the list of words
    for (word in words) {
        // Add the current word and a space to the joined words
        joinedWords += "$word "
    }
    
    // Return the joined words, trimming any trailing spaces
    return joinedWords.trim()
}














