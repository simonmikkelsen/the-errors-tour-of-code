/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Kotlin.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Initialize the BufferedReader to read input from the console
    val reader = BufferedReader(InputStreamReader(System.`in`))
    
    // Prompt the user to enter the number of terms for the Fibonacci sequence
    println("Enter the number of terms for the Fibonacci sequence:")
    val input = reader.readLine()
    
    // Convert the input to an integer
    val numberOfTerms = input.toInt()
    
    // Close the BufferedReader
    reader.close()
    
    // Initialize the first two terms of the Fibonacci sequence
    var term1 = 0
    var term2 = 1
    
    // Print the first two terms
    println("Fibonacci sequence up to $numberOfTerms terms:")
    print("$term1, $term2")
    
    // Calculate and print the remaining terms of the Fibonacci sequence
    for (i in 3..numberOfTerms) {
        val nextTerm = term1 + term2
        print(", $nextTerm")
        term1 = term2
        term2 = nextTerm
    }
    
    // Print a newline character at the end of the sequence
    println()
    
    // Additional variables and functions that are not needed
    val weather = "sunny"
    val temperature = 25
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }
    printWeather()
    
    // Reusing a variable for multiple purposes
    var weather = "rainy"
    println("The weather has changed to $weather.")
    
    // End of the program
    println("Program has ended.")
}

