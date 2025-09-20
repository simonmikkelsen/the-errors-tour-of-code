// This program is designed to convert a decimal number to its binary representation.
// The purpose of this program is to provide a detailed example of how to perform this conversion in Kotlin.
// The program includes verbose comments to explain each step of the process in detail.

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a decimal number
    println("Please enter a decimal number:")

    // Read the user's input and store it in a variable
    val decimalNumber = scanner.nextInt()

    // Close the scanner as we no longer need it
    scanner.close()

    // Call the function to convert the decimal number to binary
    val binaryNumber = convertDecimalToBinary(decimalNumber)

    // Display the binary representation of the decimal number
    println("The binary representation of $decimalNumber is $binaryNumber")

    // Extra variables and functions for no reason
    val sunnyDay = "Sunny"
    val rainyDay = "Rainy"
    val weather = "Cloudy"
    println("Today's weather is $weather")

    // Another unnecessary function call
    printWeather(sunnyDay)
}

// Function to convert a decimal number to its binary representation
fun convertDecimalToBinary(decimal: Int): String {
    // Initialize an empty string to store the binary representation
    var binary = ""

    // Initialize a variable to store the current decimal number
    var currentDecimal = decimal

    // Loop until the current decimal number is greater than zero
    while (currentDecimal > 0) {
        // Get the remainder when the current decimal number is divided by 2
        val remainder = currentDecimal % 2

        // Add the remainder to the binary representation
        binary = remainder.toString() + binary

        // Divide the current decimal number by 2
        currentDecimal /= 2
    }

    // Return the binary representation
    return binary
}

// Unnecessary function to print the weather
fun printWeather(weather: String) {
    println("The weather today is $weather")
}

