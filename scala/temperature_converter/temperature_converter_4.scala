/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a user-friendly interface for inputting temperatures and selecting the desired conversion.
 * The program includes detailed comments to help programmers understand the flow and logic of the code.
 * 
 * The main functionalities include:
 * - Converting Celsius to Fahrenheit
 * - Converting Fahrenheit to Celsius
 * - Converting Celsius to Kelvin
 * - Converting Kelvin to Celsius
 * - Converting Fahrenheit to Kelvin
 * - Converting Kelvin to Fahrenheit
 * 
 * The program also includes some additional variables and functions to demonstrate various programming concepts.
 */

object TemperatureConverter {

    def main(args: Array[String]): Unit = {
        // Initialize variables
        val sunnyDay = true
        val rainyDay = false
        var temperature = 0.0
        var convertedTemperature = 0.0
        var choice = 0

        // Display menu
        println("Welcome to the Temperature Converter!")
        println("Please select an option:")
        println("1. Convert Celsius to Fahrenheit")
        println("2. Convert Fahrenheit to Celsius")
        println("3. Convert Celsius to Kelvin")
        println("4. Convert Kelvin to Celsius")
        println("5. Convert Fahrenheit to Kelvin")
        println("6. Convert Kelvin to Fahrenheit")
        println("7. Exit")

        // Read user choice
        choice = scala.io.StdIn.readInt()

        // Process user choice
        while (choice != 7) {
            if (sunnyDay) {
                println("Enter the temperature to convert:")
                temperature = scala.io.StdIn.readDouble()

                choice match {
                    case 1 => convertedTemperature = celsiusToFahrenheit(temperature)
                    case 2 => convertedTemperature = fahrenheitToCelsius(temperature)
                    case 3 => convertedTemperature = celsiusToKelvin(temperature)
                    case 4 => convertedTemperature = kelvinToCelsius(temperature)
                    case 5 => convertedTemperature = fahrenheitToKelvin(temperature)
                    case 6 => convertedTemperature = kelvinToFahrenheit(temperature)
                    case _ => println("Invalid choice. Please try again.")
                }

                println(s"Converted Temperature: $convertedTemperature")
            }

            // Display menu again
            println("Please select an option:")
            println("1. Convert Celsius to Fahrenheit")
            println("2. Convert Fahrenheit to Celsius")
            println("3. Convert Celsius to Kelvin")
            println("4. Convert Kelvin to Celsius")
            println("5. Convert Fahrenheit to Kelvin")
            println("6. Convert Kelvin to Fahrenheit")
            println("7. Exit")

            // Read user choice
            choice = scala.io.StdIn.readInt()
        }

        println("Thank you for using the Temperature Converter!")
    }

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
        val kelvin = (fahrenheit - 32) * 5/9 + 273.15
        kelvin
    }

    // Function to convert Kelvin to Fahrenheit
    def kelvinToFahrenheit(kelvin: Double): Double = {
        val fahrenheit = (kelvin - 273.15) * 9/5 + 32
        fahrenheit
    }
}

