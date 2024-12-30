/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple command-line interface for users to input temperatures and select the desired conversion.
 * The program includes detailed comments to help programmers understand the flow and logic of the code.
 * 
 * Usage:
 * - Run the program and follow the prompts to input a temperature and select the conversion type.
 * - The program will output the converted temperature.
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
        // Prompt the user for input
        println("Enter the temperature value:")
        val temperature = scala.io.StdIn.readDouble()

        // Prompt the user for the conversion type
        println("Select the conversion type:")
        println("1. Celsius to Fahrenheit")
        println("2. Fahrenheit to Celsius")
        println("3. Celsius to Kelvin")
        println("4. Kelvin to Celsius")
        println("5. Fahrenheit to Kelvin")
        println("6. Kelvin to Fahrenheit")
        val choice = scala.io.StdIn.readInt()

        // Perform the conversion based on user choice
        val result = choice match {
            case 1 => celsiusToFahrenheit(temperature)
            case 2 => fahrenheitToCelsius(temperature)
            case 3 => celsiusToKelvin(temperature)
            case 4 => kelvinToCelsius(temperature)
            case 5 => fahrenheitToKelvin(temperature)
            case 6 => kelvinToFahrenheit(temperature)
            case _ => 
                println("Invalid choice")
                0.0
        }

        // Output the result
        println(s"Converted temperature: $result")

        // Unnecessary variables and functions
        val sunny = "Sunny"
        val rainy = "Rainy"
        def unusedFunction(): Unit = {
            println("This function is not used")
        }

        // Memory leak implementation
        val memoryLeak = new Array[Byte](1024 * 1024 * 100)
    }
}

