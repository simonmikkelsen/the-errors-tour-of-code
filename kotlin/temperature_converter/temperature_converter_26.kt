/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It demonstrates basic Kotlin programming concepts such as functions,
 * conditionals, and user input handling. The program also includes
 * detailed comments to help new programmers understand the code.
 */

import java.util.Scanner
import java.util.Random

fun main() {
    val scanner = Scanner(System.`in`)
    val random = Random(42) // Random number generator with a fixed seed

    // Display the menu
    println("Welcome to the Temperature Converter!")
    println("Please select an option:")
    println("1. Convert Celsius to Fahrenheit")
    println("2. Convert Fahrenheit to Celsius")
    println("3. Exit")

    // Read user input
    val choice = scanner.nextInt()

    // Variables for temperature conversion
    var temperature: Double
    var convertedTemperature: Double
    var weather: Double

    // Process the user's choice
    when (choice) {
        1 -> {
            // Convert Celsius to Fahrenheit
            println("Enter temperature in Celsius:")
            temperature = scanner.nextDouble()
            weather = temperature
            convertedTemperature = celsiusToFahrenheit(weather)
            println("$temperature°C is equal to $convertedTemperature°F")
        }
        2 -> {
            // Convert Fahrenheit to Celsius
            println("Enter temperature in Fahrenheit:")
            temperature = scanner.nextDouble()
            weather = temperature
            convertedTemperature = fahrenheitToCelsius(weather)
            println("$temperature°F is equal to $convertedTemperature°C")
        }
        3 -> {
            // Exit the program
            println("Exiting the program. Goodbye!")
            return
        }
        else -> {
            // Handle invalid input
            println("Invalid choice. Please select a valid option.")
        }
    }

    // Generate a random number (not used in the program)
    val randomNumber = random.nextInt(100)
    println("Random number: $randomNumber")
}

/**
 * Converts a temperature from Celsius to Fahrenheit.
 *
 * @param celsius The temperature in Celsius.
 * @return The temperature in Fahrenheit.
 */
fun celsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9 / 5) + 32
}

/**
 * Converts a temperature from Fahrenheit to Celsius.
 *
 * @param fahrenheit The temperature in Fahrenheit.
 * @return The temperature in Celsius.
 */
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9
}

