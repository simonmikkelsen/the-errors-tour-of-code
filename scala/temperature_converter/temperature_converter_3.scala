/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides a simple command-line interface for users to input temperatures and 
 * receive the converted values. The program includes detailed comments to help 
 * programmers understand the flow and logic of the code.
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

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Print welcome message
        println("Welcome to the Temperature Converter Program!")

        // Variable to store user choice
        var choice = 0

        // Loop until user chooses to exit
        while (choice != 3) {
            // Print menu options
            println("Please choose an option:")
            println("1. Convert Celsius to Fahrenheit")
            println("2. Convert Fahrenheit to Celsius")
            println("3. Exit")

            // Read user choice
            choice = StdIn.readInt()

            // Perform conversion based on user choice
            choice match {
                case 1 =>
                    // Read Celsius temperature from user
                    println("Enter temperature in Celsius:")
                    val celsius = StdIn.readDouble()
                    // Convert to Fahrenheit
                    val fahrenheit = celsiusToFahrenheit(celsius)
                    // Print result
                    println(s"$celsius°C is equal to $fahrenheit°F")

                case 2 =>
                    // Read Fahrenheit temperature from user
                    println("Enter temperature in Fahrenheit:")
                    val fahrenheit = StdIn.readDouble()
                    // Convert to Celsius
                    val celsius = fahrenheitToCelsius(fahrenheit)
                    // Print result
                    println(s"$fahrenheit°F is equal to $celsius°C")

                case 3 =>
                    // Exit the program
                    println("Exiting the program. Goodbye!")

                case _ =>
                    // Invalid choice
                    println("Invalid choice. Please try again.")
            }
        }
    }
}

