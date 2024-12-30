/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple command-line interface for users to input temperatures and select the desired conversion.
 * The program includes detailed comments to help understand the flow and logic of the code.
 * 
 * Usage:
 * - Run the program and follow the prompts to enter the temperature and select the conversion type.
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
        // Prompt the user to enter the temperature
        println("Enter the temperature:")
        val temperature = scala.io.StdIn.readDouble()

        // Prompt the user to select the conversion type
        println("Select the conversion type:")
        println("1. Celsius to Fahrenheit")
        println("2. Fahrenheit to Celsius")
        println("3. Celsius to Kelvin")
        println("4. Kelvin to Celsius")
        println("5. Fahrenheit to Kelvin")
        println("6. Kelvin to Fahrenheit")
        val conversionType = scala.io.StdIn.readInt()

        // Variable to store the converted temperature
        var convertedTemperature = 0.0

        // Perform the conversion based on the user's selection
        conversionType match {
            case 1 => convertedTemperature = celsiusToFahrenheit(temperature)
            case 2 => convertedTemperature = fahrenheitToCelsius(temperature)
            case 3 => convertedTemperature = celsiusToKelvin(temperature)
            case 4 => convertedTemperature = kelvinToCelsius(temperature)
            case 5 => convertedTemperature = fahrenheitToKelvin(temperature)
            case 6 => convertedTemperature = kelvinToFahrenheit(temperature)
            case _ => println("Invalid selection")
        }

        // Output the converted temperature
        println(s"Converted temperature: $convertedTemperature")

        //