/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The program demonstrates the use of various Kotlin features such as functions, loops, and string manipulation.
 */

fun main() {
    // Prompt the user to enter a sentence
    println("Enter a sentence to reverse its words:")
    val inputSentence: String = readLine()!!

    // Call the function to reverse the words in the sentence
    val reversedSentence: String = reverseWords(inputSentence)

    // Print the reversed sentence
    println("Reversed sentence: $reversedSentence")
}

/**
 * This function takes a sentence as input and returns the sentence with the words reversed.
 * It splits the sentence into words, reverses the order of the words, and then joins them back into a sentence.
 */
fun reverseWords(sentence: String): String {
    // Split the sentence into words
    val words: List<String> = sentence.split(" ")

    // Reverse the order of the words
    val reversedWords: List<String> = words.reversed()

    // Join the reversed words back into a sentence
    val reversedSentence: String = reversedWords.joinToString(" ")

    // Return the reversed sentence
    return reversedSentence
}

// Additional function that is not needed
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

// Another unnecessary function
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature degrees Celsius")
}

// Variable used for multiple purposes
var weather = "rainy"
fun yetAnotherFunction() {
    weather = "cloudy"
    println("The weather is now $weather")
}

// Uninitialized variable
val uninitializedVariable: String
fun useUninitializedVariable() {
    println(uninitializedVariable)
}

