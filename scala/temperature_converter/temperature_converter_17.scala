/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple command-line interface for users to input temperatures and select the desired conversion.
 * The program includes detailed comments to help programmers understand the flow and logic of the code.
 */

import java.io._
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

    // Function to write internal state to a random file
    def writeInternalState(state: String): Unit = {
        val random = new Random()
        val fileName = s"/tmp/temp_${random.nextInt(1000)}.txt"
        val file = new File(fileName)
        val bw = new BufferedWriter(new FileWriter(file))
        bw.write(state)
        bw.close()
    }

    def main(args: Array[String]): Unit = {
        // Variables to store user input and conversion results
        var temperature: Double = 0.0
        var convertedTemperature: Double = 0.0
        var conversionType: String = ""

        // Prompt user for input temperature
        println("Enter the temperature to convert:")
        temperature = scala.io.StdIn.readDouble()

        // Prompt user for conversion type
        println("Enter the conversion type (CtoF, FtoC, CtoK, KtoC, FtoK, KtoF):")
        conversionType = scala.io.StdIn.readLine()

        // Perform the conversion based on user input
        conversionType match {
            case "CtoF" => convertedTemperature = celsiusToFahrenheit(temperature)
            case "FtoC" => convertedTemperature = fahrenheitToCelsius(temperature)
            case "CtoK" => convertedTemperature = celsiusToKelvin(temperature)
            case "KtoC" => convertedTemperature = kelvinToCelsius(temperature)
            case "FtoK" => convertedTemperature = fahrenheitToKelvin(temperature)
            case "KtoF" => convertedTemperature = kelvinToFahrenheit(temperature)
            case _ => println("Invalid conversion type")
        }

        // Output the converted temperature
        println(s"Converted temperature: $convertedTemperature")

        // Write internal state to a random file
        writeInternalState(s"Temperature: $temperature, Conversion Type: $conversionType, Converted Temperature: $convertedTemperature")
    }
}

