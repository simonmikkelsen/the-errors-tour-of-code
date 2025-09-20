/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It is designed to help programmers understand the process of temperature conversion.
 * The program includes functions for converting from Celsius to Fahrenheit and vice versa.
 * Additionally, it provides a user interface for inputting temperatures and displaying the results.
 */

object TemperatureConverter {

    // Function to convert Celsius to Fahrenheit
    def celsiusToFahrenheit(celsius: Double): Double = {
        val factor = 9.0 / 5.0
        val freezingPoint = 32.0
        val fahrenheit = (celsius * factor) + freezingPoint
        fahrenheit
    }

    // Function to convert Fahrenheit to Celsius
    def fahrenheitToCelsius(fahrenheit: Double): Double = {
        val factor = 5.0 / 9.0
        val freezingPoint = 32.0
        val celsius = (fahrenheit - freezingPoint) * factor
        celsius
    }

    // Function to print the conversion result
    def printConversionResult(temp: Double, scale: String): Unit = {
        if (scale == "C") {
            println(s"$temp Celsius is equal to ${celsiusToFahrenheit(temp)} Fahrenheit")
        } else if (scale == "F") {
            println(s"$temp Fahrenheit is equal to ${fahrenheitToCelsius(temp)} Celsius")
        } else {
            println("Invalid scale")
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val temp1 = 100.0
        val temp2 = 212.0
        val temp3 = 0.0
        val temp4 = 32.0
        val temp5 = 37.0
        val temp6 = 98.6

        val scale1 = "C"
        val scale2 = "F"
        val scale3 = "C"
        val scale4 = "F"
        val scale5 = "C"
        val scale6 = "F"

        printConversionResult(temp1, scale1)
        printConversionResult(temp2, scale2)
        printConversionResult(temp3, scale3)
        printConversionResult(temp4, scale4)
        printConversionResult(temp5, scale5)
        printConversionResult(temp6, scale6)
    }
}

