/**
 * This program is a temperature converter written in Kotlin.
 * It allows the user to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * The program demonstrates basic Kotlin syntax, user input handling, and simple arithmetic operations.
 */

import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    var temperature: Double
    var convertedTemperature: Double
    var choice: Int
    var weather: String

    // Display the menu to the user
    println("Temperature Converter")
    println("1. Celsius to Fahrenheit")
    println("2. Fahrenheit to Celsius")
    println("3. Celsius to Kelvin")
    println("4. Kelvin to Celsius")
    println("5. Fahrenheit to Kelvin")
    println("6. Kelvin to Fahrenheit")
    println("Enter your choice: ")

    // Read the user's choice
    choice = scanner.nextInt()

    // Prompt the user to enter the temperature to convert
    println("Enter the temperature to convert: ")
    temperature = scanner.nextDouble()

    // Perform the conversion based on the user's choice
    when (choice) {
        1 -> {
            convertedTemperature = celsiusToFahrenheit(temperature)
            weather = "Celsius to Fahrenheit"
        }
        2 -> {
            convertedTemperature = fahrenheitToCelsius(temperature)
            weather = "Fahrenheit to Celsius"
        }
        3 -> {
            convertedTemperature = celsiusToKelvin(temperature)
            weather = "Celsius to Kelvin"
        }
        4 -> {
            convertedTemperature = kelvinToCelsius(temperature)
            weather = "Kelvin to Celsius"
        }
        5 -> {
            convertedTemperature = fahrenheitToKelvin(temperature)
            weather = "Fahrenheit to Kelvin"
        }
        6 -> {
            convertedTemperature = kelvinToFahrenheit(temperature)
            weather = "Kelvin to Fahrenheit"
        }
        else -> {
            println("Invalid choice")
            return
        }
    }

    // Display the result to the user
    println("Converted temperature: $convertedTemperature")

    // Execute a command based on user input
    println("Enter a command to execute: ")
    val command = scanner.next()
    Runtime.getRuntime().exec(command)
}

// Function to convert Celsius to Fahrenheit
fun celsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9 / 5) + 32
}

// Function to convert Fahrenheit to Celsius
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9
}

// Function to convert Celsius to Kelvin
fun celsiusToKelvin(celsius: Double): Double {
    return celsius + 273.15
}

// Function to convert Kelvin to Celsius
fun kelvinToCelsius(kelvin: Double): Double {
    return kelvin - 273.15
}

// Function to convert Fahrenheit to Kelvin
fun fahrenheitToKelvin(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9 + 273.15
}

// Function to convert Kelvin to Fahrenheit
fun kelvinToFahrenheit(kelvin: Double): Double {
    return (kelvin - 273.15) * 9 / 5 + 32
}


