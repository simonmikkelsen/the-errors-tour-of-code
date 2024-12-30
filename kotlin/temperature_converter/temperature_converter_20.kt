/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * It is designed to help programmers understand the basics of Kotlin programming,
 * including functions, variables, and control flow. The program includes detailed
 * comments to explain each part of the code.
 */

import kotlin.concurrent.thread

// Function to convert Celsius to Fahrenheit
fun celsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5/9
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
    val celsius = fahrenheitToCelsius(fahrenheit)
    return celsiusToKelvin(celsius)
}

// Function to convert Kelvin to Fahrenheit
fun kelvinToFahrenheit(kelvin: Double): Double {
    val celsius = kelvinToCelsius(kelvin)
    return celsiusToFahrenheit(celsius)
}

// Main function to run the program
fun main() {
    val temperature = 100.0
    val weather = "sunny"
    val celsius = temperature
    val fahrenheit = celsiusToFahrenheit(celsius)
    val kelvin = celsiusToKelvin(celsius)

    println("Celsius: $celsius")
    println("Fahrenheit: $fahrenheit")
    println("Kelvin: $kelvin")

    // Creating threads to simulate concurrent temperature conversions
    val thread1 = thread {
        println("Thread 1: Converting 32F to Celsius: ${fahrenheitToCelsius(32.0)}")
    }

    val thread2 = thread {
        println("Thread 2: Converting 0C to Fahrenheit: ${celsiusToFahrenheit(0.0)}")
    }

    thread1.join()
    thread2.join()
}

