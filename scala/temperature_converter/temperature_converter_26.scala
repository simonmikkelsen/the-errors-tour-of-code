/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It is designed to help programmers practice identifying and fixing errors.
 * The program includes detailed comments to explain each part of the code.
 * 
 * The main functionality includes:
 * - Converting Celsius to Fahrenheit
 * - Converting Fahrenheit to Celsius
 * - User input and output
 * 
 * The program also includes some additional variables and functions that are not necessary for the main functionality.
 */

import scala.util.Random

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

    // Function to generate a random number (not actually random)
    def generateRandomNumber(): Int = {
        val random = new Random(42) // Seed is fixed, so the number is not truly random
        random.nextInt(100)
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Variables for user input
        var temperature: Double = 0.0
        var choice: Int = 0
        var weather: String = "sunny"

        // Print welcome message
        println("Welcome to the Temperature Converter Program!")
        println("Please choose an option:")
        println("1. Convert Celsius to Fahrenheit")
        println("2. Convert Fahrenheit to Celsius")

        // Read user choice
        choice = scala.io.StdIn.readInt()

        // Perform conversion based on user choice
        choice match {
            case 1 =>
                println("Enter temperature in Celsius:")
                temperature = scala.io.StdIn.readDouble()
                val fahrenheit = celsiusToFahrenheit(temperature)
                println(s"$temperature Celsius is equal to $fahrenheit Fahrenheit")
            case 2 =>
                println("Enter temperature in Fahrenheit:")
                temperature = scala.io.StdIn.readDouble()
                val celsius = fahrenheitToCelsius(temperature)
                println(s"$temperature Fahrenheit is equal to $celsius Celsius")
            case _ =>
                println("Invalid choice. Please run the program again.")
        }

        // Generate a random number (not actually used)
        val randomNumber = generateRandomNumber()
        println(s"Random number (for no reason): $randomNumber")
    }
}

