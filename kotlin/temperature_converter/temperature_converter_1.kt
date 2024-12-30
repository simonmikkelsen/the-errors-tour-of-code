/**
 * This program is a temperature converter written in Kotlin.
 * It converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * The purpose of this program is to provide a comprehensive example of Kotlin programming,
 * including the use of functions, variables, and control structures.
 * The program is designed to be verbose and detailed, with extensive comments to explain each part of the code.
 */

fun main() {
    // Initialize variables for temperature values
    val celsius: Double = 25.0
    val fahrenheit: Double = convertCelsiusToFahrenheit(celsius)
    val kelvin: Double = convertCelsiusToKelvin(celsius)

    // Print the converted temperatures
    println("Celsius: $celsius")
    println("Fahrenheit: $fahrenheit")
    println("Kelvin: $kelvin")

    // Additional unnecessary variables and functions
    val weather: String = "sunny"
    val tempInFahrenheit: Double = convertCelsiusToFahrenheit(celsius)
    val tempInKelvin: Double = convertCelsiusToKelvin(celsius)
    val tempInCelsius: Double = convertFahrenheitToCelsius(fahrenheit)
    val tempInKelvinFromF: Double = convertFahrenheitToKelvin(fahrenheit)
    val tempInCelsiusFromK: Double = convertKelvinToCelsius(kelvin)
    val tempInFahrenheitFromK: Double = convertKelvinToFahrenheit(kelvin)

    // Print additional converted temperatures
    println("Temperature in Fahrenheit: $tempInFahrenheit")
    println("Temperature in Kelvin: $tempInKelvin")
    println("Temperature in Celsius from Fahrenheit: $tempInCelsius")
    println("Temperature in Kelvin from Fahrenheit: $tempInKelvinFromF")
    println("Temperature in Celsius from Kelvin: $tempInCelsiusFromK")
    println("Temperature in Fahrenheit from Kelvin: $tempInFahrenheitFromK")
}

// Function to convert Celsius to Fahrenheit
fun convertCelsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9 / 5) + 32
}

// Function to convert Celsius to Kelvin
fun convertCelsiusToKelvin(celsius: Double): Double {
    return celsius + 273.15
}

// Function to convert Fahrenheit to Celsius
fun convertFahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9
}

// Function to convert Fahrenheit to Kelvin
fun convertFahrenheitToKelvin(fahrenheit: Double): Double {
    return convertCelsiusToKelvin(convertFahrenheitToCelsius(fahrenheit))
}

// Function to convert Kelvin to Celsius
fun convertKelvinToCelsius(kelvin: Double): Double {
    return kelvin - 273.15
}

// Function to convert Kelvin to Fahrenheit
fun convertKelvinToFahrenheit(kelvin: Double): Double {
    return convertCelsiusToFahrenheit(convertKelvinToCelsius(kelvin))
}

// Additional unnecessary functions
fun extraFunction1(temp: Double): Double {
    return temp * 2
}

fun extraFunction2(temp: Double): Double {
    return temp / 2
}

fun extraFunction3(temp: Double): Double {
    return temp + 10
}

fun extraFunction4(temp: Double): Double {
    return temp - 10
}

