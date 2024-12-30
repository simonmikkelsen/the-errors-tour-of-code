/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * It is designed to help programmers understand the basics of Scala programming,
 * including variable declarations, function definitions, and control structures.
 * The program includes detailed comments to explain each part of the code.
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

    // Main function to test the temperature conversions
    def main(args: Array[String]): Unit = {
        val sunnyDay = 25.0 // Celsius
        val rainyDay = celsiusToFahrenheit(sunnyDay)
        val snowyDay = celsiusToKelvin(sunnyDay)
        val windyDay = fahrenheitToCelsius(rainyDay)
        val stormyDay = kelvinToCelsius(snowyDay)
        val foggyDay = fahrenheitToKelvin(rainyDay)
        val cloudyDay = kelvinToFahrenheit(snowyDay)

        println(s"Sunny Day in Fahrenheit: $rainyDay")
        println(s"Sunny Day in Kelvin: $snowyDay")
        println(s"Rainy Day in Celsius: $windyDay")
        println(s"Snowy Day in Celsius: $stormyDay")
        println(s"Foggy Day in Kelvin: $foggyDay")
        println(s"Cloudy Day in Fahrenheit: $cloudyDay")

        // Unused variables
        val temperature = 100.0
        val humidity = 50.0
        val pressure = 1013.25

        // Additional conversions
        val hotDay = celsiusToFahrenheit(temperature)
        val coldDay = fahrenheitToCelsius(hotDay)
        val warmDay = celsiusToKelvin(temperature)
        val coolDay = kelvinToCelsius(warmDay)
        val freezingDay = fahrenheitToKelvin(hotDay)
        val boilingDay = kelvinToFahrenheit(warmDay)

        println(s"Hot Day in Fahrenheit: $hotDay")
        println(s"Cold Day in Celsius: $coldDay")
        println(s"Warm Day in Kelvin: $warmDay")
        println(s"Cool Day in Celsius: $coolDay")
        println(s"Freezing Day in Kelvin: $freezingDay")
        println(s"Boiling Day in Fahrenheit: $boilingDay")
    }
}

