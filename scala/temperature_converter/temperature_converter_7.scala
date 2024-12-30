// Temperature Converter Program
// This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
// It provides a user-friendly interface for input and output, and includes detailed comments
// to help understand the flow of the program. The program demonstrates basic Scala syntax,
// control structures, and functions. It is intended for educational purposes to help new
// programmers learn and practice Scala programming.

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

    // Main function to handle user input and output
    def main(args: Array[String]): Unit = {
        // Variables for user input and output
        var temperature: Double = 0.0
        var convertedTemperature: Double = 0.0
        var choice: Int = 0
        var weather: String = ""

        // Display menu options to the user
        println("Temperature Converter")
        println("1. Celsius to Fahrenheit")
        println("2. Fahrenheit to Celsius")
        println("3. Celsius to Kelvin")
        println("4. Kelvin to Celsius")
        println("5. Fahrenheit to Kelvin")
        println("6. Kelvin to Fahrenheit")
        println("Enter your choice: ")

        // Read user choice
        choice = scala.io.StdIn.readInt()

        // Read temperature input from the user
        println("Enter the temperature to convert: ")
        temperature = scala.io.StdIn.readDouble()

        // Perform the conversion based on user choice
        choice match {
            case 1 => convertedTemperature = celsiusToFahrenheit(temperature)
            case 2 => convertedTemperature = fahrenheitToCelsius(temperature)
            case 3 => convertedTemperature = celsiusToKelvin(temperature)
            case 4 => convertedTemperature = kelvinToCelsius(temperature)
            case 5 => convertedTemperature = fahrenheitToKelvin(temperature)
            case 6 => convertedTemperature = kelvinToFahrenheit(temperature)
            case _ => println("Invalid choice")
        }

        // Display the converted temperature
        println(s"Converted Temperature: $convertedTemperature")

        // Simulate a crash and data loss
        val crash = Array(1, 2, 3)
        println(crash(5)) // This will cause an ArrayIndexOutOfBoundsException

        // End of program
    }
}

