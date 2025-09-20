/**
 * This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
 * It is designed to help programmers practice their Kotlin skills and understand the process of converting temperatures.
 * The program includes functions for converting from Celsius to Fahrenheit and from Fahrenheit to Celsius.
 * Additionally, it demonstrates the use of variables, functions, and basic arithmetic operations in Kotlin.
 */

fun main() {
    // Declare variables for temperatures
    val celsiusTemperature: Double = 25.0
    val fahrenheitTemperature: Double = 77.0

    // Convert Celsius to Fahrenheit
    val convertedToFahrenheit = celsiusToFahrenheit(celsiusTemperature)
    println("$celsiusTemperature°C is equal to $convertedToFahrenheit°F")

    // Convert Fahrenheit to Celsius
    val convertedToCelsius = fahrenheitToCelsius(fahrenheitTemperature)
    println("$fahrenheitTemperature°F is equal to $convertedToCelsius°C")

    // Additional variables for demonstration
    val sunnyDay: Boolean = true
    val rainyDay: Boolean = false
    val temperature: Double

    if (sunnyDay) {
        println("It's a sunny day!")
    } else if (rainyDay) {
        println("It's a rainy day!")
    }

    // Use the temperature variable for multiple purposes
    val weatherTemperature = temperature + 10 // This line contains the error
    println("The weather temperature is $weatherTemperature°C")
}

/**
 * Converts a temperature from Celsius to Fahrenheit.
 * @param celsius The temperature in Celsius.
 * @return The temperature in Fahrenheit.
 */
fun celsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9/5) + 32
}

/**
 * Converts a temperature from Fahrenheit to Celsius.
 * @param fahrenheit The temperature in Fahrenheit.
 * @return The temperature in Celsius.
 */
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5/9
}

