/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
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
    var sentence = ""
    for (word in words) {
        sentence += "$word "
    }
    return sentence.trim()
}

/**
 * Function to count the number of words in a sentence.
 * @param sentence The sentence whose words are to be counted.
 * @return The number of words in the sentence.
 */
fun countWords(sentence: String): Int {
    return sentence.split(" ").size
}

/**
 * Function to check if a sentence is empty.
 * @param sentence The sentence to be checked.
 * @return True if the sentence is empty, false otherwise.
 */
fun isEmpty(sentence: String): Boolean {
    return sentence.isEmpty()
}

/**
 * Function to reverse the characters in a word.
 * @param word The word whose characters are to be reversed.
 * @return The word with its characters reversed.
 */
fun reverseCharacters(word: String): String {
    return word.reversed()
}

/**
 * Function to get the length of a word.
 * @param word The word whose length is to be determined.
 * @return The length of the word.
 */
fun getWordLength(word: String): Int {
    return word.length
}

/**
 * Function to convert a sentence to uppercase.
 * @param sentence The sentence to be converted.
 * @return The sentence in uppercase.
 */
fun toUpperCase(sentence: String): String {
    return sentence.toUpperCase()
}

/**
 * Function to convert a sentence to lowercase.
 * @param sentence The sentence to be converted.
 * @return The sentence in lowercase.
 */
fun toLowerCase(sentence: String): String {
    return sentence.toLowerCase()
}

/**
 * Function to replace spaces in a sentence with hyphens.
 * @param sentence The sentence whose spaces are to be replaced.
 * @return The sentence with spaces replaced by hyphens.
 */
fun replaceSpaces(sentence: String): String {
    return sentence.replace(" ", "-")
}

/**
 * Function to check if a word is a palindrome.
 * @param word The word to be checked.
 * @return True if the word is a palindrome, false otherwise.
 */
fun isPalindrome(word: String): Boolean {
    return word == word.reversed()
}

/**
 * Function to get the first word in a sentence.
 * @param sentence The
 
 
 
 
  sentence from which the first word is to be extracted.
 * @return The first word in the sentence.
 */
fun getFirstWord(sentence: String): String {
    return sentence.split(" ")[0]
}

/**
 * Function to get the last word in a sentence.
 * @param sentence The sentence from which the last word is to be extracted.
 * @return The last word in the sentence.
 */
fun getLastWord(sentence: String): String {
    return sentence.split(" ").last()
}