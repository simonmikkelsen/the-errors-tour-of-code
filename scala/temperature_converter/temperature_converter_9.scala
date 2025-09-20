/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides a simple command-line interface for users to input a temperature value
 * and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
 * The program demonstrates basic input/output operations, conditional statements,
 * and arithmetic calculations in Scala.
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

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variables for user input
        var temperature: Double = 0.0
        var conversionType: String = ""
        var weather: String = "sunny"

        // Prompt user for temperature value
        println("Enter the temperature value:")
        temperature = scala.io.StdIn.readDouble()

        // Prompt user for conversion type
        println("Enter the conversion type (CtoF or FtoC):")
        conversionType = scala.io.StdIn.readLine()

        // Perform the conversion based on user input
        if (conversionType == "CtoF") {
            val result = celsiusToFahrenheit(temperature)
            println(s"The temperature in Fahrenheit is: $result")
        } else if (conversionType == "FtoC") {
            val result = fahrenheitToCelsius(temperature)
            println(s"The temperature in Celsius is: $result")
        } else {
            println("Invalid conversion type. Please enter 'CtoF' or 'FtoC'.")
        }

        // Additional variables and functions that are not needed
        val humidity: Int = 50
        val windSpeed: Double = 10.5
        def printWeather(): Unit = {
            println(s"The weather is $weather with a humidity of $humidity% and wind speed of $windSpeed km/h.")
        }
        printWeather()
    }
}

