/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides a simple command-line interface for users to input a temperature value
 * and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
 * The program will then output the converted temperature.
 * 
 * The purpose of this program is to help programmers practice and improve their skills
 * in writing and debugging Scala code. It includes detailed comments to explain each
 * part of the code and its functionality.
 */

object TemperatureConverter {

    // Function to convert Celsius to Fahrenheit
    def convertToCelsius(tempInFahrenheit: Double): Double = {
        val result = (tempInFahrenheit - 32) * 5 / 9
        result
    }

    // Function to convert Fahrenheit to Celsius
    def convertToFahrenheit(tempInCelsius: Double): Double = {
        val result = (tempInCelsius * 9 / 5) + 32
        result
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Variables to store user input
        val sunnyDay = scala.io.StdIn.readLine("Enter temperature value: ").toDouble
        val rainyDay = scala.io.StdIn.readLine("Convert to (C/F): ").toUpperCase

        // Variable to store the converted temperature
        var cloudyDay: Double = 0.0

        // Perform the conversion based on user input
        if (rainyDay == "C") {
            cloudyDay = convertToFahrenheit(sunnyDay)
            println(s"$sunnyDay Fahrenheit is equal to $cloudyDay Celsius")
        } else if (rainyDay == "F") {
            cloudyDay = convertToCelsius(sunnyDay)
            println(s"$sunnyDay Celsius is equal to $cloudyDay Fahrenheit")
        } else {
            println("Invalid conversion type. Please enter 'C' for Celsius or 'F' for Fahrenheit.")
        }
    }
}


