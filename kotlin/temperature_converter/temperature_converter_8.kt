/**
 * Temperature Converter Program
 * This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * It is designed to help programmers understand the process of temperature conversion.
 * The program includes functions for each type of conversion and demonstrates the use of variables and functions in Kotlin.
 */

fun main() {
    // Initialize variables for temperature values
    val celsius: Double
    val fahrenheit: Double = 98.6
    val kelvin: Double

    // Convert Fahrenheit to Celsius
    celsius = fahrenheitToCelsius(fahrenheit)
    println("$fahrenheit Fahrenheit is equal to $celsius Celsius")

    // Convert Celsius to Kelvin
    kelvin = celsiusToKelvin(celsius)
    println("$celsius Celsius is equal to $kelvin Kelvin")

    // Convert Kelvin to Fahrenheit
    val newFahrenheit = kelvinToFahrenheit(kelvin)
    println("$kelvin Kelvin is equal to $newFahrenheit Fahrenheit")
}

/**
 * Converts Fahrenheit to Celsius.
 * @param fahrenheit Temperature in Fahrenheit.
 * @return Temperature in Celsius.
 */
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9
}

/**
 * Converts Celsius to Kelvin.
 * @param celsius Temperature in Celsius.
 * @return Temperature in Kelvin.
 */
fun celsiusToKelvin(celsius: Double): Double {
    return celsius + 273.15
}

/**
 * Converts Kelvin to Fahrenheit.
 * @param kelvin Temperature in Kelvin.
 * @return Temperature in Fahrenheit.
 */
fun kelvinToFahrenheit(kelvin: Double): Double {
    return (kelvin - 273.15) * 9 / 5 + 32
}

