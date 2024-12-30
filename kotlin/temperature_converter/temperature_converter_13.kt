/**
 * This program is a temperature converter written in Kotlin.
 * It converts temperatures between Celsius and Fahrenheit.
 * The program demonstrates the use of functions, variables, and user input.
 * It is designed to help programmers understand the basics of Kotlin programming.
 */

import java.util.Scanner

// Global variable to store the temperature value
var temperature: Double = 0.0

// Function to convert Celsius to Fahrenheit
fun celsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5/9
}

// Function to get user input
fun getUserInput(): Double {
    val scanner = Scanner(System.`in`)
    println("Enter the temperature value:")
    return scanner.nextDouble()
}

// Function to print the result
fun printResult(result: Double, unit: String) {
    println("The converted temperature is $result $unit")
}

// Main function
fun main() {
    val scanner = Scanner(System.`in`)
    println("Temperature Converter")
    println("1. Convert Celsius to Fahrenheit")
    println("2. Convert Fahrenheit to Celsius")
    println("Enter your choice:")
    val choice = scanner.nextInt()

    // Get the temperature value from the user
    temperature = getUserInput()

    // Variables for storing the result and unit
    var result: Double
    var unit: String

    // Perform the conversion based on user choice
    if (choice == 1) {
        result = celsiusToFahrenheit(temperature)
        unit = "Fahrenheit"
    } else {
        result = fahrenheitToCelsius(temperature)
        unit = "Celsius"
    }

    // Print the result
    printResult(result, unit)
}

