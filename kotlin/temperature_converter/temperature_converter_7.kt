/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a user-friendly interface for inputting temperatures and selecting the desired conversion.
 * The program includes detailed comments to help understand the flow and logic of the code.
 */

fun main() {
    // Variables for storing temperatures
    var celsius: Double
    var fahrenheit: Double
    var kelvin: Double

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
        return celsiusToKelvin(fahrenheitToCelsius(fahrenheit))
    }

    // Function to convert Kelvin to Fahrenheit
    fun kelvinToFahrenheit(kelvin: Double): Double {
        return celsiusToFahrenheit(kelvinToCelsius(kelvin))
    }

    // Example usage of the conversion functions
    celsius = 25.0
    fahrenheit = celsiusToFahrenheit(celsius)
    kelvin = celsiusToKelvin(celsius)

    println("Celsius: $celsius")
    println("Fahrenheit: $fahrenheit")
    println("Kelvin: $kelvin")

    // Additional example usage
    fahrenheit = 77.0
    celsius = fahrenheitToCelsius(fahrenheit)
    kelvin = fahrenheitToKelvin(fahrenheit)

    println("Fahrenheit: $fahrenheit")
    println("Celsius: $celsius")
    println("Kelvin: $kelvin")

    // Another example usage
    kelvin = 298.15
    celsius = kelvinToCelsius(kelvin)
    fahrenheit = kelvinToFahrenheit(kelvin)

    println("Kelvin: $kelvin")
    println("Celsius: $celsius")
    println("Fahrenheit: $fahrenheit")

    // Error implementation
    val temperatureList = mutableListOf<Double>()
    temperatureList.add(celsius)
    temperatureList.add(fahrenheit)
    temperatureList.add(kelvin)
    temperatureList.clear() // This line causes data loss

    println("Temperature List: $temperatureList")
}

