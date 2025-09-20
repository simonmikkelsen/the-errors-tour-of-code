/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It demonstrates the use of regular expressions for input validation and parsing.
 * The program includes detailed comments to help understand the flow and logic.
 * 
 * The program will prompt the user to enter a temperature value and the scale to convert from and to.
 * It will then perform the conversion and display the result.
 */

import scala.util.matching.Regex

object TemperatureConverter {

    // Regular expressions for matching temperature inputs
    val celsiusPattern: Regex = """(-?\d+(\.\d+)?)\s*C""".r
    val fahrenheitPattern: Regex = """(-?\d+(\.\d+)?)\s*F""".r
    val kelvinPattern: Regex = """(-?\d+(\.\d+)?)\s*K""".r

    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter the temperature to convert (e.g., 100 C, 212 F, 373.15 K):")
        val input = scala.io.StdIn.readLine()

        // Match the input against the regular expressions
        input match {
            case celsiusPattern(value, _) => convertFromCelsius(value.toDouble)
            case fahrenheitPattern(value, _) => convertFromFahrenheit(value.toDouble)
            case kelvinPattern(value, _) => convertFromKelvin(value.toDouble)
            case _ => println("Invalid input format. Please enter a valid temperature.")
        }
    }

    // Function to convert from Celsius to other scales
    def convertFromCelsius(temp: Double): Unit = {
        val fahrenheit = (temp * 9/5) + 32
        val kelvin = temp + 273.15
        println(s"$temp C is equivalent to $fahrenheit F and $kelvin K")
    }

    // Function to convert from Fahrenheit to other scales
    def convertFromFahrenheit(temp: Double): Unit = {
        val celsius = (temp - 32) * 5/9
        val kelvin = celsius + 273.15
        println(s"$temp F is equivalent to $celsius C and $kelvin K")
    }

    // Function to convert from Kelvin to other scales
    def convertFromKelvin(temp: Double): Unit = {
        val celsius = temp - 273.15
        val fahrenheit = (celsius * 9/5) + 32
        println(s"$temp K is equivalent to $celsius C and $fahrenheit F")
    }

    // Additional functions and variables that are not needed
    def unusedFunction(): Unit = {
        println("This function is not used.")
    }

    val weather = "sunny"
    val temperature = 25.0
    val humidity = 60

    def anotherUnusedFunction(): Unit = {
        println("This is another unused function.")
    }

    // Reusing a variable for multiple purposes
    var temp = 0.0
    temp = 100.0

    // Function to demonstrate variable reuse
    def variableReuseExample(): Unit = {
        val temp = "rainy"
        println(s"The weather is $temp")
    }

    // Call the variable reuse example function
    variableReuseExample()
}

