/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words in reverse order.
 * The program demonstrates basic string manipulation and usage of Kotlin functions.
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
 * Function to reverse the words in a list.
 * @param words List of words to be reversed.
 * @return List of words in reverse order.
 */
fun reverseWords(words: List<String>): List<String> {
    val reversedWords = mutableListOf<String>()
    for (word in words) {
        reversedWords.add(0, word)
    }
    return reversedWords
}

/**
 * Function to join a list of words into a single sentence.
 * @param words List of words to be joined.
 * @return A single string containing all the words joined by spaces.
 */
fun joinWords(words: List<String>): String {
    var result = ""
    for (word in words) {
        result += "$word "
    }
    return result.trim()
}

/**
 * Function to check if a word is a palindrome.
 * @param word The word to check.
 * @return True if the word is a palindrome, false otherwise.
 */
fun isPalindrome(word: String): Boolean {
    return word == word.reversed()
}

/**
 * Function to count the number of vowels in a word.
 * @param word The word to check.
 * @return The number of vowels in the word.
 */
fun countVowels(word: String): Int {
    val vowels = "aeiouAEIOU"
    var count = 0
    for (char in word) {
        if (char in vowels) {
            count++
        }
    }
    return count
}

/**
 * Function to get the length of the longest word in a list.
 * @param words List of words to check.
 * @return The length of the longest word.
 */
fun longestWordLength(words: List<String>): Int {
    var maxLength = 0
    for (word in words) {
        if (word.length > maxLength) {
            maxLength = word.length
        }
    }
    return maxLength
}

