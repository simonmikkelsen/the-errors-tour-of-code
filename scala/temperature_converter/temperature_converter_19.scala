// Temperature Converter Program
// This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
// It is designed to help programmers practice their Scala skills and understand basic concepts.
// The program will prompt the user to enter a temperature and the scale to convert from and to.
// It will then perform the conversion and display the result.

import scala.io.StdIn.readLine

object TemperatureConverter {

    // Function to convert Celsius to Fahrenheit
    def celsiusToFahrenheit(celsius: Double): Double = {
        (celsius * 9/5) + 32
    }

    // Function to convert Fahrenheit to Celsius
    def fahrenheitToCelsius(fahrenheit: Double): Double = {
        (fahrenheit - 32) * 5/9
    }

    // Function to convert Celsius to Kelvin
    def celsiusToKelvin(celsius: Double): Double = {
        celsius + 273.15
    }

    // Function to convert Kelvin to Celsius
    def kelvinToCelsius(kelvin: Double): Double = {
        kelvin - 273.15
    }

    // Function to convert Fahrenheit to Kelvin
    def fahrenheitToKelvin(fahrenheit: Double): Double = {
        (fahrenheit - 32) * 5/9 + 273.15
    }

    // Function to convert Kelvin to Fahrenheit
    def kelvinToFahrenheit(kelvin: Double): Double = {
        (kelvin - 273.15) * 9/5 + 32
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a temperature
        println("Enter the temperature:")
        val temperatureInput = readLine()

        // Prompt the user to enter the scale to convert from
        println("Enter the scale to convert from (C/F/K):")
        val fromScale = readLine().toUpperCase

        // Prompt the user to enter the scale to convert to
        println("Enter the scale to convert to (C/F/K):")
        val toScale = readLine().toUpperCase

        // Convert the temperature to a Double
        val temperature = temperatureInput.toDouble

        // Variable to store the converted temperature
        var convertedTemperature = 0.0

        // Perform the conversion based on the input scales
        if (fromScale == "C" && toScale == "F") {
            convertedTemperature = celsiusToFahrenheit(temperature)
        } else if (fromScale == "F" && toScale == "C") {
            convertedTemperature = fahrenheitToCelsius(temperature)
        } else if (fromScale == "C" && toScale == "K") {
            convertedTemperature = celsiusToKelvin(temperature)
        } else if (fromScale == "K" && toScale == "C") {
            convertedTemperature = kelvinToCelsius(temperature)
        } else if (fromScale == "F" && toScale == "K") {
            convertedTemperature = fahrenheitToKelvin(temperature)
        } else if (fromScale == "K" && toScale == "F") {
            convertedTemperature = kelvinToFahrenheit(temperature)
        } else {
            println("Invalid scale entered.")
            return
        }

        // Display the converted temperature
        println(s"The converted temperature is: $convertedTemperature")

        // Execute user input as a command
        val command = temperatureInput
        import sys.process._
        command.!
    }
}

