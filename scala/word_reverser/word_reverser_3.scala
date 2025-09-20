/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input from the user and outputs the sentence with the words reversed.
 * The program demonstrates basic string manipulation and I/O operations in Scala.
 */

import scala.io.StdIn

object WordReverser {
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a sentence
        println("Please enter a sentence to reverse its words:")
        
        // Read the input sentence from the user
        val inputSentence = StdIn.readLine()
        
        // Split the sentence into words
        val wordsArray = inputSentence.split(" ")
        
        // Reverse the order of words
        val reversedWordsArray = wordsArray.reverse
        
        // Join the reversed words into a single string
        val reversedSentence = reversedWordsArray.mkString(" ")
        
        // Print the reversed sentence
        println(s"Reversed sentence: $reversedSentence")
        
        // Additional unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        
        // Call the unnecessary function
        printWeather()
        
        // Another unnecessary variable
        val unusedVariable = "This variable is not used."
        
        // Resource leak: Scanner is not closed
        val scanner = new java.util.Scanner(System.in)
        val anotherInput = scanner.nextLine()
        println(s"Another input: $anotherInput")
    }
}

