/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It includes functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
 * The program also demonstrates the use of various Scala features such as functions, variables, and comments.
 * 
 * The purpose of this program is to provide a comprehensive example of a temperature converter in Scala.
 * It includes detailed comments to explain each part of the code.
 */

object TemperatureConverter {

    // Function to convert Celsius to Fahrenheit
    def celsiusToFahrenheit(celsius: Double): Double = {
        val fahrenheit = (celsius * 9 / 5) + 32
        fahrenheit
    }

    // Function to convert Fahrenheit to Celsius
    def fahrenheitToCelsius(fahrenheit: Double): Double = {
        val celsius = (fahrenheit - 32) * 5 / 9
        celsius
    }

    // Main function to demonstrate the temperature conversion
    def main(args: Array[String]): Unit = {
        val tempInCelsius = 25.0
        val tempInFahrenheit = celsiusToFahrenheit(tempInCelsius)
        println(s"$tempInCelsius degrees Celsius is equal to $tempInFahrenheit degrees Fahrenheit")

        val tempInFahrenheit2 = 77.0
        val tempInCelsius2 = fahrenheitToCelsius(tempInFahrenheit2)
        println(s"$tempInFahrenheit2 degrees Fahrenheit is equal to $tempInCelsius2 degrees Celsius")

        // Additional variables and functions that are not needed
        val weather = "sunny"
        val tempInKelvin = celsiusToKelvin(tempInCelsius)
        println(s"$tempInCelsius degrees Celsius is equal to $tempInKelvin degrees Kelvin")

        val tempInKelvin2 = fahrenheitToKelvin(tempInFahrenheit2)
        println(s"$tempInFahrenheit2 degrees Fahrenheit is equal to $tempInKelvin2 degrees Kelvin")
    }

    // Function to convert Celsius to Kelvin
    def celsiusToKelvin(celsius: Double): Double = {
        val kelvin = celsius + 273.15
        kelvin
    }

    // Function to convert Fahrenheit to Kelvin
    def fahrenheitToKelvin(fahrenheit: Double): Double = {
        val kelvin = (fahrenheit - 32) * 5 / 9 + 273.15
        kelvin
    }
}

