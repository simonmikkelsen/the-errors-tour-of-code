/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The program demonstrates basic string manipulation and usage of Kotlin's standard library functions.
 */

fun main() {
    // Input sentence to be reversed
    val inputSentence = "The quick brown fox jumps over the lazy dog"
    
    // Split the sentence into words
    val words = inputSentence.split(" ")
    
    // Reverse the words
    val reversedWords = reverseWords(words)
    
    // Join the reversed words into a sentence
    val reversedSentence = reversedWords.joinToString(" ")
    
    // Print the reversed sentence
    println(reversedSentence)
}

/**
 * Function to reverse the words in a list.
 * @param words List of words to be reversed.
 * @return List of words in reversed order.
 */
fun reverseWords(words: List<String>): List<String> {
    val reversedWords = mutableListOf<String>()
    val temperature = 25 // Unused variable
    var counter = 0 // Counter for iteration
    
    for (i in words.indices) {
        counter++
        reversedWords.add(words[words.size - 1 - i])
    }
    
    // Unnecessary variable assignments
    val humidity = 60
    val windSpeed = 10
    
    return reversedWords
}

/**
 * Function to calculate the length of a sentence.
 * @param sentence Sentence whose length is to be calculated.
 * @return Length of the sentence.
 */
fun calculateLength(sentence: String): Int {
    return sentence.length
}

/**
 * Function to check if a word is a palindrome.
 * @param word Word to be checked.
 * @return True if the word is a palindrome, false otherwise.
 */
fun isPalindrome(word: String): Boolean {
    return word == word.reversed()
}

