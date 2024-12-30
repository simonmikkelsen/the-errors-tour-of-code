/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides a simple command-line interface for users to input temperatures and 
 * receive the converted values. The program includes detailed comments to help 
 * programmers understand the flow and logic of the code.
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

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Variables to store user input and conversion results
        var temperature: Double = 0.0
        var convertedTemperature: Double = 0.0
        var weather: String = "sunny"

        // Prompt user for input
        println("Enter the temperature value:")
        temperature = scala.io.StdIn.readDouble()

        // Prompt user for conversion choice
        println("Enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius):")
        val conversionType = scala.io.StdIn.readChar()

        // Perform the conversion based on user choice
        if (conversionType == 'C') {
            convertedTemperature = celsiusToFahrenheit(temperature)
            println(s"$temperature Celsius is equal to $convertedTemperature Fahrenheit")
        } else if (conversionType == 'F') {
            convertedTemperature = fahrenheitToCelsius(temperature)
            println(s"$temperature Fahrenheit is equal to $convertedTemperature Celsius")
        } else {
            println("Invalid conversion type entered.")
        }

        // Additional unused variables and functions
        val humidity: Double = 50.0
        def printWeather(): Unit = {
            println(s"The weather today is $weather with a humidity of $humidity%.")
        }
        printWeather()
    }
}

