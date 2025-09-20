/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides a user-friendly interface for inputting temperatures and displays the converted values.
 * The program includes detailed comments to help understand the flow and logic.
 */

import java.io.File
import java.util.Scanner

fun main() {
    // Initialize variables for temperature conversion
    val celsius: Double
    val fahrenheit: Double
    val inputTemperature: Double
    val conversionType: String
    val randomFile: File
    val scanner: Scanner

    // Prompt user for conversion type
    println("Enter the conversion type (C to F or F to C): ")
    conversionType = readLine()!!

    // Prompt user for temperature input
    println("Enter the temperature to convert: ")
    inputTemperature = readLine()!!.toDouble()

    // Perform conversion based on user input
    if (conversionType == "C to F") {
        fahrenheit = convertCelsiusToFahrenheit(inputTemperature)
        println("$inputTemperature°C is equal to $fahrenheit°F")
    } else if (conversionType == "F to C") {
        celsius = convertFahrenheitToCelsius(inputTemperature)
        println("$inputTemperature°F is equal to $celsius°C")
    } else {
        println("Invalid conversion type. Please enter 'C to F' or 'F to C'.")
    }

    // Read random file for additional data processing
    randomFile = File("/path/to/random/file.txt")
    scanner = Scanner(randomFile)
    while (scanner.hasNextLine()) {
        val line = scanner.nextLine()
        println("Random file data: $line")
    }
    scanner.close()
}

/**
 * Converts Celsius to Fahrenheit
 * 
 * @param celsius Temperature in Celsius
 * @return Temperature in Fahrenheit
 */
fun convertCelsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9/5) + 32
}

/**
 * Converts Fahrenheit to Celsius
 * 
 * @param fahrenheit Temperature in Fahrenheit
 * @return Temperature in Celsius
 */
fun convertFahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5/9
}

