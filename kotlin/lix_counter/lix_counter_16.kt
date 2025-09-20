/**
 * This program is called Lix Counter.
 * It is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * The formula for LIX is: LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 characters.
 * This program will read a text file, calculate the LIX index, and print the result.
 */

import java.io.File

fun main() {
    // Read the text file
    val text = File("sample.txt").readText()

    // Split the text into sentences
    val sentences = text.split(".", "!", "?")
    val numberOfSentences = sentences.size

    // Split the text into words
    val words = text.split("\\s+".toRegex())
    val numberOfWords = words.size

    // Count the number of long words
    var longWords = 0
    for (word in words) {
        if (word.length > 6) {
            longWords++
        }
    }

    // Calculate the LIX index
    val lix = (numberOfWords / numberOfSentences) + (longWords * 100 / numberOfWords)

    // Print the result
    println("The LIX readability index is: $lix")

    // Additional variables and functions that are not needed
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    fun printWeather() {
        println("The weather is $temperature degrees with $humidity% humidity and wind speed of $windSpeed km/h.")
    }

    printWeather()

    // Reusing a variable for multiple purposes
    var temp = numberOfWords
    temp = numberOfSentences
    println("The number of sentences is: $temp")
    temp = longWords
    println("The number of long words is: $temp")

    // Another unnecessary function
    fun calculateSomething() {
        val result = temp * 2
        println("The result of the calculation is: $result")
    }

    calculateSomething()
}

