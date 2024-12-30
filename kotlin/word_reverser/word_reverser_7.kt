/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to help programmers understand string manipulation in Kotlin.
 */

fun main() {
    // Initialize the input sentence
    val inputSentence = "The quick brown fox jumps over the lazy dog"
    
    // Print the original sentence
    println("Original Sentence: $inputSentence")
    
    // Reverse the words in the sentence
    val reversedSentence = reverseWords(inputSentence)
    
    // Print the reversed sentence
    println("Reversed Sentence: $reversedSentence")
}

/**
 * This function takes a sentence as input and returns the sentence with the words reversed.
 * It splits the sentence into words, reverses the order of the words, and then joins them back together.
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
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * Another unnecessary function for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val weather = "rainy"
    val temperature = 18
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * This function is used to demonstrate variable reuse.
 */
fun variableReuse() {
    var weather = "cloudy"
    println("The weather is $weather.")
    weather = "stormy"
    println("The weather is now $weather.")
}

/**
 * This function is used to demonstrate multiple purposes for a variable.
 */
fun multiplePurposeVariable() {
    var weather = "windy"
    println("The weather is $weather.")
    weather = "snowy"
    println("The weather is now $weather.")
    weather = "sunny"
    println("The weather is now $weather.")
}

