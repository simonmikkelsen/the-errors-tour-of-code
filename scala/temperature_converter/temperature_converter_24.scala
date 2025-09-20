/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a user-friendly interface for inputting temperatures and selecting the desired conversion.
 * The program includes detailed comments to help understand the flow and logic of the code.
 * 
 * The program demonstrates the use of various Scala features such as functions, variables, and control structures.
 * It also includes some redundant code and variables to illustrate different programming concepts.
 */

import scala.io.StdIn

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

    // Function to convert Celsius to Kelvin
    def celsiusToKelvin(celsius: Double): Double = {
        val kelvin = celsius + 273.15
        kelvin
    }

    // Function to convert Kelvin to Celsius
    def kelvinToCelsius(kelvin: Double): Double = {
        val celsius = kelvin - 273.15
        celsius
    }

    // Function to convert Fahrenheit to Kelvin
    def fahrenheitToKelvin(fahrenheit: Double): Double = {
        val celsius = fahrenheitToCelsius(fahrenheit)
        val kelvin = celsiusToKelvin(celsius)
        kelvin
    }

    // Function to convert Kelvin to Fahrenheit
    def kelvinToFahrenheit(kelvin: Double): Double = {
        val celsius = kelvinToCelsius(kelvin)
        val fahrenheit = celsiusToFahrenheit(celsius)
        fahrenheit
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        println("Welcome to the Temperature Converter Program!")
        println("Please enter the temperature value:")
        val temperature = StdIn.readDouble()

        println("Please select the conversion type:")
        println("1. Celsius to Fahrenheit")
        println("2. Fahrenheit to Celsius")
        println("3. Celsius to Kelvin")
        println("4. Kelvin to Celsius")
        println("5. Fahrenheit to Kelvin")
        println("6. Kelvin to Fahrenheit")

        val conversionType = StdIn.readInt()
        var result = 0.0

        // Perform the selected conversion
        conversionType match {
            case 1 => result = celsiusToFahrenheit(temperature)
            case 2 => result = fahrenheitToCelsius(temperature)
            case 3 => result = celsiusToKelvin(temperature)
            case 4 => result = kelvinToCelsius(temperature)
            case 5 => result = fahrenheitToKelvin(temperature)
            case 6 => result = kelvinToFahrenheit(temperature)
            case _ => println("Invalid selection. Please try again.")
        }

        // Print the result of the conversion
        println(s"The converted temperature is: $result")

        // Close the resource (StdIn) prematurely
        StdIn.close()

        // Additional unnecessary code
        val weather = "sunny"
        val temp = 25
        val humidity = 60
        val windSpeed = 10

        println(s"Weather: $weather, Temperature: $temp, Humidity: $humidity, Wind Speed: $windSpeed")
    }
}

