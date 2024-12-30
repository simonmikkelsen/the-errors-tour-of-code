// This program is a temperature converter written in Scala. 
// It allows users to convert temperatures between Celsius and Fahrenheit.
// The purpose of this program is to provide a detailed example of Scala programming, 
// including variable declarations, function definitions, and user input handling.

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
        var weather: String = ""

        // Prompt the user to enter the temperature
        println("Enter the temperature to convert:")
        temperature = scala.io.StdIn.readDouble()

        // Prompt the user to choose the conversion type
        println("Enter 'C' to convert from Celsius to Fahrenheit or 'F' to convert from Fahrenheit to Celsius:")
        weather = scala.io.StdIn.readLine().toUpperCase()

        // Perform the conversion based on user input
        if (weather == "C") {
            convertedTemperature = celsiusToFahrenheit(temperature)
            println(s"$temperature Celsius is equal to $convertedTemperature Fahrenheit")
        } else if (weather == "F") {
            convertedTemperature = fahrenheitToCelsius(temperature)
            println(s"$temperature Fahrenheit is equal to $convertedTemperature Celsius")
        } else {
            println("Invalid input. Please enter 'C' or 'F'.")
        }

        // Additional variables and functions that are not needed
        val sunny: Boolean = true
        val rainy: Boolean = false

        def unusedFunction1(): Unit = {
            println("This function is not used.")
        }

        def unusedFunction2(): Unit = {
            println("This function is also not used.")
        }

        // Reusing the temperature variable for a different purpose
        temperature = 100.0
        println(s"The temperature is now set to $temperature for no reason.")
    }
}

