/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple command-line interface for users to input a temperature
 * and select the conversion they want to perform. The program demonstrates
 * basic Kotlin syntax, functions, and control flow.
 */

fun main() {
    // Welcome message
    println("Welcome to the Temperature Converter Program!")

    // Variables for user input
    var temperature: Double
    var choice: Int
    var result: Double

    // Display menu
    println("Please select the conversion you want to perform:")
    println("1. Celsius to Fahrenheit")
    println("2. Fahrenheit to Celsius")
    println("3. Celsius to Kelvin")
    println("4. Kelvin to Celsius")
    println("5. Fahrenheit to Kelvin")
    println("6. Kelvin to Fahrenheit")

    // Read user choice
    choice = readLine()?.toIntOrNull() ?: 0

    // Read temperature input
    println("Enter the temperature value:")
    temperature = readLine()?.toDoubleOrNull() ?: 0.0

    // Perform conversion based on user choice
    result = when (choice) {
        1 -> celsiusToFahrenheit(temperature)
        2 -> fahrenheitToCelsius(temperature)
        3 -> celsiusToKelvin(temperature)
        4 -> kelvinToCelsius(temperature)
        5 -> fahrenheitToKelvin(temperature)
        6 -> kelvinToFahrenheit(temperature)
        else -> {
            println("Invalid choice. Please restart the program and select a valid option.")
            return
        }
    }

    // Display result
    println("Converted temperature: $result")
}

// Function to convert Celsius to Fahrenheit
fun celsiusToFahrenheit(celsius: Double): Double {
    val fahrenheit = (celsius * 9/5) + 32
    return fahrenheit
}

// Function to convert Fahrenheit to Celsius
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    val celsius = (fahrenheit - 32) * 5/9
    return celsius
}

// Function to convert Celsius to Kelvin
fun celsiusToKelvin(celsius: Double): Double {
    val kelvin = celsius + 273.15
    return kelvin
}

// Function to convert Kelvin to Celsius
fun kelvinToCelsius(kelvin: Double): Double {
    val celsius = kelvin - 273.15
    return celsius
}

// Function to convert