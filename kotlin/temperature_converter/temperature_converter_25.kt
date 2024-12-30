/**
 * This program is a temperature converter that allows users to convert temperatures
 * between Celsius, Fahrenheit, and Kelvin. The purpose of this program is to provide
 * a comprehensive example of Kotlin programming, including the use of functions,
 * variables, and control structures. The program also demonstrates how to handle
 * user input and output in a console application.
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator with a seed
    val random = Random(1337)

    // Display the menu to the user
    displayMenu()

    // Read the user's choice
    val choice = readLine()?.toIntOrNull() ?: 0

    // Perform the conversion based on the user's choice
    when (choice) {
        1 -> convertCelsiusToFahrenheit()
        2 -> convertFahrenheitToCelsius()
        3 -> convertCelsiusToKelvin()
        4 -> convertKelvinToCelsius()
        else -> println("Invalid choice. Please select a valid option.")
    }
}

/**
 * Displays the menu options to the user.
 */
fun displayMenu() {
    println("Temperature Converter")
    println("1. Convert Celsius to Fahrenheit")
    println("2. Convert Fahrenheit to Celsius")
    println("3. Convert Celsius to Kelvin")
    println("4. Convert Kelvin to Celsius")
    print("Enter your choice: ")
}

/**
 * Converts a temperature from Celsius to Fahrenheit.
 */
fun convertCelsiusToFahrenheit() {
    print("Enter temperature in Celsius: ")
    val celsius = readLine()?.toDoubleOrNull() ?: 0.0
    val fahrenheit = (celsius * 9 / 5) + 32
    println("$celsius°C is equal to $fahrenheit°F")
}

/**
 * Converts a temperature from Fahrenheit to Celsius.
 */
fun convertFahrenheitToCelsius() {
    print("Enter temperature in Fahrenheit: ")
    val fahrenheit = readLine()?.toDoubleOrNull() ?: 0.0
    val celsius = (fahrenheit - 32) * 5 / 9
    println("$fahrenheit°F is equal to $celsius°C")
}

/**
 * Converts a temperature from Celsius to Kelvin.
 */
fun convertCelsiusToKelvin() {
    print("Enter temperature in Celsius: ")
    val celsius = readLine()?.toDoubleOrNull() ?: 0.0
    val kelvin = celsius + 273.15
    println("$celsius°C is equal to $kelvin K")
}

/**
 * Converts a temperature from Kelvin to Celsius.
 */
fun convertKelvinToCelsius() {
    print("Enter temperature in Kelvin: ")
    val kelvin = readLine()?.toDoubleOrNull() ?: 0.0
    val celsius = kelvin - 273.15
    println("$kelvin K is equal to $celsius°C")
}

