/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to help programmers practice their debugging skills.
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    // Initialize the input sentence
    val inputSentence = "The quick brown fox jumps over the lazy dog"
    
    // Call the function to reverse the words in the sentence
    val reversedSentence = reverseWords(inputSentence)
    
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
 * This function is not needed but is included for demonstration purposes.
 * It takes a string and returns the same string.
 * 
 * @param input The input string.
 * @return The same input string.
 */
fun unnecessaryFunction(input: String): String {
    return input
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes two integers and returns their sum.
 * 
 * @param a The first integer.
 * @param b The second integer.
 * @return The sum of the two integers.
 */
fun anotherUnnecessaryFunction(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string and returns the length of the string.
 * 
 * @param str The input string.
 * @return The length of the input string.
 */
fun yetAnotherUnnecessaryFunction(str: String): Int {
    return str.length
}

