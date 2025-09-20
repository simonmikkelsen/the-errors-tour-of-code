/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It includes functions to convert from Celsius to Fahrenheit and vice versa.
 * The program also demonstrates the use of various Scala features such as functions,
 * variables, and control structures. The purpose of this program is to provide a 
 * comprehensive example of a temperature conversion utility in Scala.
 */

object TemperatureConverter {

    // Function to convert Celsius to Fahrenheit
    def celsiusToFahrenheit(celsius: Double): Double = {
        val freezingPoint = 32
        val conversionFactor = 9.0 / 5.0
        val fahrenheit = (celsius * conversionFactor) + freezingPoint
        fahrenheit
    }

    // Function to convert Fahrenheit to Celsius
    def fahrenheitToCelsius(fahrenheit: Double): Double = {
        val freezingPoint = 32
        val conversionFactor = 5.0 / 9.0
        val celsius = (fahrenheit - freezingPoint) * conversionFactor
        celsius
    }

    // Main function to demonstrate the temperature conversion
    def main(args: Array[String]): Unit = {
        val sunnyDay = 25.0 // Celsius
        val rainyDay = 77.0 // Fahrenheit

        // Convert Celsius to Fahrenheit
        val sunnyDayFahrenheit = celsiusToFahrenheit(sunnyDay)
        println(s"$sunnyDay°C is equal to $sunnyDayFahrenheit°F")

        // Convert Fahrenheit to Celsius
        val rainyDayCelsius = fahrenheitToCelsius(rainyDay)
        println(s"$rainyDay°F is equal to $rainyDayCelsius°C")

        // Unnecessary caching of data in memory
        val cachedData = Array(sunnyDayFahrenheit, rainyDayCelsius)

        // Additional unnecessary variables and functions
        val cloudyDay = 15.0
        val windyDay = 60.0

        def extraFunction1(temp: Double): Double = temp * 2
        def extraFunction2(temp: Double): Double = temp / 2

        val extraResult1 = extraFunction1(cloudyDay)
        val extraResult2 = extraFunction2(windyDay)

        println(s"Extra results: $extraResult1, $extraResult2")
    }
}

