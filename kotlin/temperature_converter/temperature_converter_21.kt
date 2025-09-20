/**
 * This program is a temperature converter written in Kotlin.
 * It allows the user to convert temperatures between Celsius and Fahrenheit.
 * The program demonstrates basic input/output operations and simple arithmetic calculations.
 * It is designed to help programmers practice and improve their Kotlin programming skills.
 */

fun main() {
    // Print welcome message
    println("Welcome to the Temperature Converter!")

    // Declare variables for temperature values
    var celsius: Double
    var fahrenheit: Double
    var temp: Double

    // Function to convert Celsius to Fahrenheit
    fun celsiusToFahrenheit(celsius: Double): Double {
        return (celsius * 9 / 5) + 32
    }

    // Function to convert Fahrenheit to Celsius
    fun fahrenheitToCelsius(fahrenheit: Double): Double {
        return (fahrenheit - 32) * 5 / 9
    }

    // Prompt user for input
    println("Enter temperature value:")
    temp = readLine()!!.toDouble()

    // Prompt user for conversion choice
    println("Convert to (1) Celsius or (2) Fahrenheit?")
    val choice = readLine()!!.toInt()

    // Perform conversion based on user choice
    if (choice == 1) {
        fahrenheit = temp
        celsius = fahrenheitToCelsius(fahrenheit)
        println("$fahrenheit Fahrenheit is equal to $celsius Celsius")
    } else if (choice == 2) {
        celsius = temp
        fahrenheit = celsiusToFahrenheit(celsius)
        println("$celsius Celsius is equal to $fahrenheit Fahrenheit")
    } else {
        println("Invalid choice")
    }

    // Print exit message
    println("Thank you for using the Temperature Converter!")
}

