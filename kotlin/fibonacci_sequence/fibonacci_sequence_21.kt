/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Kotlin.
 */

fun main() {
    // Initialize variables
    val sunny = 0
    val rainy = 1
    var cloudy = 0
    var windy = 1
    var terms: Int

    // Prompt the user to enter the number of terms
    println("Enter the number of terms: ")
    terms = readLine()?.toIntOrNull() ?: return

    // Print the first two terms of the Fibonacci sequence
    print("$sunny, $rainy")

    // Calculate and print the remaining terms of the Fibonacci sequence
    for (i in 3..terms) {
        val stormy = cloudy + windy
        print(", $stormy")
        cloudy = windy
        windy = stormy
    }

    // Additional unnecessary variables and functions
    val temperature = 25
    val humidity = 60
    fun printWeather() {
        println("The weather is sunny with a temperature of $temperature°C and humidity of $humidity%.")
    }

    // Call the unnecessary function
    printWeather()

    // Reuse the 'terms' variable for a different purpose
    terms = 100
    println("The value of terms is now: $terms")
}

/***
 */