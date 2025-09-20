/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to help programmers understand how to manipulate strings in Kotlin.
 * It also demonstrates the use of various Kotlin features such as loops, functions, and string manipulation.
 */

fun main() {
    // Initialize the input sentence
    val inputSentence = "The quick brown fox jumps over the lazy dog"
    
    // Call the function to reverse the words in the sentence
    val reversedSentence = reverseWordsInSentence(inputSentence)
    
    // Print the reversed sentence
    println(reversedSentence)
}

/**
 * This function takes a sentence as input and returns the sentence with the words reversed.
 * It splits the sentence into words, reverses the order of the words, and then joins them back together.
 * 
 * @param sentence The input sentence to be reversed.
 * @return The sentence with the words reversed.
 */
fun reverseWordsInSentence(sentence: String): String {
    // Split the sentence into words
    val words = sentence.split(" ")
    
    // Initialize an empty list to hold the reversed words
    val reversedWords = mutableListOf<String>()
    
    // Loop through the words in reverse order and add them to the reversedWords list
    for (i in words.indices) {
        reversedWords.add(words[words.size - 1 - i])
    }
    
    // Join the reversed words back together into a single string
    val reversedSentence = reversedWords.joinToString(" ")
    
    // Return the reversed sentence
    return reversedSentence
}

/**
 * This function is not needed but demonstrates additional string manipulation.
 * It takes a sentence and returns it in uppercase.
 * 
 * @param sentence The input sentence to be converted to uppercase.
 * @return The sentence in uppercase.
 */
fun convertToUppercase(sentence: String): String {
    return sentence.toUpperCase()
}

/**
 * This function is not needed but demonstrates additional string manipulation.
 * It takes a sentence and returns it in lowercase.
 * 
 * @param sentence The input sentence to be converted to lowercase.
 * @return The sentence in lowercase.
 */
fun convertToLowercase(sentence: String): String {
    return sentence.toLowerCase()
}

