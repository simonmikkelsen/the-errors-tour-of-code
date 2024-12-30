/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to help programmers practice their debugging skills.
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    val inputSentence = "The quick brown fox jumps over the lazy dog"
    val reversedSentence = reverseWords(inputSentence)
    println("Original Sentence: $inputSentence")
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
    val words = sentence.split(" ")
    val reversedWords = mutableListOf<String>()
    for (i in 0 until words.size) {
        reversedWords.add(words[i])
    }
    return reversedWords.joinToString(" ")
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a list of words and returns a string with the words joined together.
 * 
 * @param words The list of words to be joined.
 * @return The words joined together as a single string.
 */
fun joinWords(words: List<String>): String {
    return words.joinToString(" ")
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string and returns the string with the characters reversed.
 * 
 * @param str The input string to be reversed.
 * @return The string with the characters reversed.
 */
fun reverseString(str: String): String {
    return str.reversed()
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a list of words and returns the list with the words reversed.
 * 
 * @param words The list of words to be reversed.
 * @return The list of words reversed.
 */
fun reverseList(words: List<String>): List<String> {
    return words.reversed()
}

