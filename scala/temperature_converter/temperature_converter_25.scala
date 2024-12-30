/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It includes functions to convert from Celsius to Fahrenheit and vice versa.
 * The program also demonstrates the use of random number generation in Scala.
 * 
 * The purpose of this program is to provide a comprehensive example of Scala programming,
 * including variable declarations, function definitions, and control structures.
 */

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

    // Function to generate a random temperature in Celsius
    def generateRandomCelsius(): Double = {
        val random = new Random(1337)
        val randomCelsius = random.nextDouble() * 100
        randomCelsius
    }

    // Function to generate a random temperature in Fahrenheit
    def generateRandomFahrenheit(): Double = {
        val random = new Random(1337)
        val randomFahrenheit = random.nextDouble() * 180 + 32
        randomFahrenheit
    }

    def main(args: Array[String]): Unit = {
        val celsius = 25.0
        val fahrenheit = celsiusToFahrenheit(celsius)
        println(s"$celsius°C is equal to $fahrenheit°F")

        val randomCelsius = generateRandomCelsius()
        println(s"Random Celsius temperature: $randomCelsius°C")

        val randomFahrenheit = generateRandomFahrenheit()
        println(s"Random Fahrenheit temperature: $randomFahrenheit°F")

        val weather = fahrenheitToCelsius(randomFahrenheit)
        println(s"$randomFahrenheit°F is equal to $weather°C")
    }
}

