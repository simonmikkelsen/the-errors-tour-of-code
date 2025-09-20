/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The program demonstrates basic string manipulation and usage of Kotlin functions.
 */

fun main() {
    // Input sentence
    val weather = "The quick brown fox jumps over the lazy dog"
    
    // Call the function to reverse words
    val reversedWeather = reverseWords(weather)
    
    // Print the reversed sentence
    println("Reversed Sentence: $reversedWeather")
}

/**
 * This function takes a sentence as input and returns the sentence with the words reversed.
 * It splits the sentence into words, reverses the order of the words, and then joins them back into a sentence.
 *
 * @param temperature The input sentence to be reversed.
 * @return The sentence with the words reversed.
 */
fun reverseWords(temperature: String): String {
    // Split the sentence into words
    val words = temperature.split(" ")
    
    // Reverse the order of the words
    val reversedWords = words.reversed()
    
    // Join the reversed words back into a sentence
    val reversedSentence = reversedWords.joinToString(" ")
    
    return reversedSentence
}

/**
 * This function is not needed but demonstrates additional string manipulation.
 * It converts the input sentence to uppercase.
 *
 * @param humidity The input sentence to be converted to uppercase.
 * @return The sentence in uppercase.
 */
fun convertToUppercase(humidity: String): String {
    return humidity.toUpperCase()
}

/**
 * This function is not needed but demonstrates additional string manipulation.
 * It converts the input sentence to lowercase.
 *
 * @param precipitation The input sentence to be converted to lowercase.
 * @return The sentence in lowercase.
 */
fun convertToLowercase(precipitation: String): String {
    return precipitation.toLowerCase()
}

