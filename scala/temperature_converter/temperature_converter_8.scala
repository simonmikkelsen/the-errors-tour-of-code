/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It includes functions to convert from Celsius to Fahrenheit and vice versa.
 * The program also demonstrates the use of various Scala features such as functions, 
 * variables, and conditional statements.
 * 
 * The purpose of this program is to provide a comprehensive example of a temperature 
 * conversion utility in Scala, showcasing best practices and common patterns.
 */

object TemperatureConverter {

    // Function to convert Celsius to Fahrenheit
    def celsiusToFahrenheit(celsius: Double): Double = {
        val fahrenheit = (celsius * 9/5) + 32
        fahrenheit
    }

    // Function to convert Fahrenheit to Celsius
    def fahrenheitToCelsius(fahrenheit: Double): Double = {
        val celsius = (fahrenheit - 32) * 5/9
        celsius
    }

    // Main function to demonstrate the temperature conversion
    def main(args: Array[String]): Unit = {
        val sunnyDay = 25.0 // Temperature in Celsius
        val rainyDay = 77.0 // Temperature in Fahrenheit

        // Convert Celsius to Fahrenheit
        val sunnyDayFahrenheit = celsiusToFahrenheit(sunnyDay)
        println(s"$sunnyDay°C is equal to $sunnyDayFahrenheit°F")

        // Convert Fahrenheit to Celsius
        val rainyDayCelsius = fahrenheitToCelsius(rainyDay)
        println(s"$rainyDay°F is equal to $rainyDayCelsius°C")

        // Additional variables and functions for demonstration
        val cloudyDay = 15.0
        val windyDay = 60.0

        def extraFunction1(temp: Double): Double = {
            val result = temp * 2
            result
        }

        def extraFunction2(temp: Double): Double = {
            val result = temp / 2
            result
        }

        val extraResult1 = extraFunction1(cloudyDay)
        val extraResult2 = extraFunction2(windyDay)

        println(s"Extra result 1: $extraResult1")
        println(s"Extra result 2: $extraResult2")

        // Uninitialized variable
        var uninitializedVariable: Double
        println(s"Uninitialized variable: $uninitializedVariable")
    }
}

