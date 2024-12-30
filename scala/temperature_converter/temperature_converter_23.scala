/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a user-friendly interface for inputting temperatures and selecting the desired conversion.
 * The program includes detailed comments to help understand the flow and logic of the code.
 * 
 * The main functionalities include:
 * - Converting Celsius to Fahrenheit
 * - Converting Fahrenheit to Celsius
 * - Converting Celsius to Kelvin
 * - Converting Kelvin to Celsius
 * - Converting Fahrenheit to Kelvin
 * - Converting Kelvin to Fahrenheit
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

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val sunny = 100.0
        val rainy = celsiusToFahrenheit(sunny)
        println(s"100 degrees Celsius is equal to $rainy degrees Fahrenheit")

        val cloudy = 212.0
        val stormy = fahrenheitToCelsius(cloudy)
        println(s"212 degrees Fahrenheit is equal to $stormy degrees Celsius")

        val windy = 0.0
        val snowy = celsiusToKelvin(windy)
        println(s"0 degrees Celsius is equal to $snowy Kelvin")

        val foggy = 273.15
        val misty = kelvinToCelsius(foggy)
        println(s"273.15 Kelvin is equal to $misty degrees Celsius")

        val thunder = 32.0
        val lightning = fahrenheitToKelvin(thunder)
        println(s"32 degrees Fahrenheit is equal to $lightning Kelvin")

        val hail = 373.15
        val sleet = kelvinToFahrenheit(hail)
        println(s"373.15 Kelvin is equal to $sleet degrees Fahrenheit")

        // Self-modifying code (error)
        val code = "println(\"This is a self-modifying code example\")"
        val runtime = Runtime.getRuntime
        runtime.exec(Array("sh", "-c", s"echo $code >> TemperatureConverter.scala"))
    }
}

