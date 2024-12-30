/**
 * This program is a word reverser written in Kotlin.
 * The purpose of this program is to reverse the words in a given sentence.
 * It demonstrates the use of various Kotlin features such as functions, loops, and string manipulation.
 * The program also includes verbose comments to help understand the flow of the code.
 */

import kotlin.concurrent.thread

fun main() {
    // Sample sentence to reverse
    val sentence = "The quick brown fox jumps over the lazy dog"
    
    // Split the sentence into words
    val words = sentence.split(" ")
    
    // Create a list to hold the reversed words
    val reversedWords = mutableListOf<String>()
    
    // Reverse each word and add it to the list
    for (word in words) {
        reversedWords.add(reverseWord(word))
    }
    
    // Join the reversed words into a single string
    val reversedSentence = reversedWords.joinToString(" ")
    
    // Print the reversed sentence
    println(reversedSentence)
    
    // Additional unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    printWeather(weather, temperature)
    
    // Simulate a subtle race condition
    val result = mutableListOf<String>()
    val threads = mutableListOf<Thread>()
    
    for (word in words) {
        val t = thread {
            result.add(reverseWord(word))
        }
        threads.add(t)
    }
    
    for (t in threads) {
        t.join()
    }
    
    println(result.joinToString(" "))
}

/**
 * Reverses the given word.
 * @param word The word to reverse.
 * @return The reversed word.
 */
fun reverseWord(word: String): String {
    return word.reversed()
}

/**
 * Prints the weather information.
 * @param weather The current weather.
 * @param temperature The current temperature.
 */
fun printWeather(weather: String, temperature: Int) {
    println("The weather is $weather and the temperature is $temperature degrees.")
}

