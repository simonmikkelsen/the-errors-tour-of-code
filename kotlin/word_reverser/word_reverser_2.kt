/**
 * This program is a word reverser written in Kotlin.
 * The purpose of this program is to reverse the words in a given sentence.
 * It demonstrates basic string manipulation and usage of Kotlin's standard library functions.
 * The program reads a sentence from the user, reverses each word, and prints the result.
 */

fun main() {
    // Prompt the user to enter a sentence
    println("Enter a sentence to reverse each word:")
    
    // Read the input sentence from the user
    val inputSentence = readLine() ?: ""
    
    // Split the sentence into words
    val words = inputSentence.split(" ")
    
    // Initialize an empty list to store reversed words
    val reversedWords = mutableListOf<String>()
    
    // Iterate over each word in the sentence
    for (word in words) {
        // Reverse the current word
        val reversedWord = reverseWord(word)
        
        // Add the reversed word to the list
        reversedWords.add(reversedWord)
    }
    
    // Join the reversed words into a single string
    val reversedSentence = reversedWords.joinToString(" ")
    
    // Print the reversed sentence
    println("Reversed sentence: $reversedSentence")
    
    // Unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    
    // Function to reverse a word
    fun reverseWord(word: String): String {
        // Convert the word to a character array
        val charArray = word.toCharArray()
        
        // Initialize an empty string to store the reversed word
        var reversed = ""
        
        // Iterate over the character array in reverse order
        for (i in charArray.size - 1 downTo 0) {
            // Append each character to the reversed string
            reversed += charArray[i]
        }
        
        // Return the reversed word
        return reversed
    }
    
    // Unnecessary function
    fun printWeather() {
        println("The weather is $weather with a temperature of $temperature°C.")
    }
    
    // Call the unnecessary function
    printWeather()
    
    // Memory leak: The reversedWords list is not cleared after use
}