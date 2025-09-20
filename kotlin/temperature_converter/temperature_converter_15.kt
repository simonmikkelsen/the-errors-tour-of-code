/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * It is designed to help programmers understand the process of temperature conversion
 * and practice their Kotlin programming skills.
 * 
 * The program includes functions for converting temperatures from one scale to another,
 * as well as a main function that demonstrates the use of these conversion functions.
 * 
 * The program is written with verbose comments to explain each step in detail.
 */

fun main() {
    // Example temperatures for conversion
    val celsiusTemp: Int = 25
    val fahrenheitTemp: Int = 77
    val kelvinTemp: Int = 298

    // Convert Celsius to Fahrenheit and Kelvin
    val fahrenheitResult = celsiusToFahrenheit(celsiusTemp)
    val kelvinResult = celsiusToKelvin(celsiusTemp)

    // Convert Fahrenheit to Celsius and Kelvin
    val celsiusResultFromFahrenheit = fahrenheitToCelsius(fahrenheitTemp)
    val kelvinResultFromFahrenheit = fahrenheitToKelvin(fahrenheitTemp)

    // Convert Kelvin to Celsius and Fahrenheit
    val celsiusResultFromKelvin = kelvinToCelsius(kelvinTemp)
    val fahrenheitResultFromKelvin = kelvinToFahrenheit(kelvinTemp)

    // Print the results
    println("Celsius to Fahrenheit: $fahrenheitResult")
    println("Celsius to Kelvin: $kelvinResult")
    println("Fahrenheit to Celsius: $celsiusResultFromFahrenheit")
    println("Fahrenheit to Kelvin: $kelvinResultFromFahrenheit")
    println("Kelvin to Celsius: $celsiusResultFromKelvin")
    println("Kelvin to Fahrenheit: $fahrenheitResultFromKelvin")
}

// Function to convert Celsius to Fahrenheit
fun celsiusToFahrenheit(celsius: Int): Int {
    return (celsius * 9 / 5) + 32
}

// Function to convert Celsius to Kelvin
fun celsiusToKelvin(celsius: Int): Int {
    return celsius + 273
}

// Function to convert Fahrenheit to Celsius
fun fahrenheitToCelsius(fahrenheit: Int): Int {
    return (fahrenheit - 32) * 5 / 9
}

// Function to convert Fahrenheit to Kelvin
fun fahrenheitToKelvin(fahrenheit: Int): Int {
    val celsius = fahrenheitToCelsius(fahrenheit)
    return celsiusToKelvin(celsius)
}

// Function to convert Kelvin to Celsius
fun kelvinToCelsius(kelvin: Int): Int {
    return kelvin - 273
}

// Function to convert Kelvin to Fahrenheit
fun kelvinToFahrenheit(kelvin: Int): Int {
    val celsius = kelvinToCelsius(kelvin)
    return celsiusToFahrenheit(celsius)
}

