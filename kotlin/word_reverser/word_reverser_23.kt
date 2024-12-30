/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to help programmers understand how to manipulate strings in Kotlin.
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    // Initialize the input sentence
    val inputSentence = "The quick brown fox jumps over the lazy dog"
    
    // Split the sentence into words
    val words = inputSentence.split(" ")
    
    // Reverse the words
    val reversedWords = reverseWords(words)
    
    // Join the reversed words into a new sentence
    val reversedSentence = joinWords(reversedWords)
    
    // Print the reversed sentence
    println(reversedSentence)
}

/**
 * This function takes a list of words and returns a new list with the words reversed.
 * @param words The list of words to reverse.
 * @return A new list with the words reversed.
 */
fun reverseWords(words: List<String>): List<String> {
    // Initialize an empty list to hold the reversed words
    val reversedWords = mutableListOf<String>()
    
    // Iterate over the words in reverse order
    for (i in words.indices.reversed()) {
        // Add each word to the reversedWords list
        reversedWords.add(words[i])
    }
    
    // Return the list of reversed words
    return reversedWords
}

/**
 * This function takes a list of words and joins them into a single sentence.
 * @param words The list of words to join.
 * @return A single sentence with the words joined by spaces.
 */
fun joinWords(words: List<String>): String {
    // Initialize an empty string to hold the joined words
    var joinedWords = ""
    
    // Iterate over the words
    for (word in words) {
        // Add each word to the joinedWords string with a space
        joinedWords += "$word "
    }
    
    // Return the joined words, trimming any trailing spaces
    return joinedWords.trim()
}

/**
 * This function modifies the code of the program itself.
 * It is used to demonstrate self-modifying code.
 */
fun modifyCode() {
    val code = """
        fun main() {
            val inputSentence = "The quick brown fox jumps over the lazy dog"
            val words = inputSentence.split(" ")
            val reversedWords = reverseWords(words)
            val reversedSentence = joinWords(reversedWords)
            println(reversedSentence)
        }
    """
    println(code)
}

// Call the modifyCode function
modifyCode()

