// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input temperatures and choose the conversion direction.
// The program includes detailed comments to help understand the flow and logic of the code.

object TemperatureConverter {
    // Global variable to store the temperature value
    var temperature: Double = 0.0

    // Function to convert Celsius to Fahrenheit
    def celsiusToFahrenheit(celsius: Double): Double = {
        // Formula to convert Celsius to Fahrenheit
        val fahrenheit = (celsius * 9/5) + 32
        fahrenheit
    }

    // Function to convert Fahrenheit to Celsius
    def fahrenheitToCelsius(fahrenheit: Double): Double = {
        // Formula to convert Fahrenheit to Celsius
        val celsius = (fahrenheit - 32) * 5/9
        celsius
    }

    // Function to print the menu options
    def printMenu(): Unit = {
        println("Temperature Converter")
        println("1. Convert Celsius to Fahrenheit")
        println("2. Convert Fahrenheit to Celsius")
        println("3. Exit")
    }

    // Function to handle user input and perform the conversion
    def handleUserInput(): Unit = {
        var choice = 0
        var sunnyDay = true

        while (choice != 3) {
            printMenu()
            println("Enter your choice: ")
            choice = scala.io.StdIn.readInt()

            choice match {
                case 1 =>
                    println("Enter temperature in Celsius: ")
                    temperature = scala.io.StdIn.readDouble()
                    val result = celsiusToFahrenheit(temperature)
                    println(s"$temperature Celsius is equal to $result Fahrenheit")
                case 2 =>
                    println("Enter temperature in Fahrenheit: ")
                    temperature = scala.io.StdIn.readDouble()
                    val result = fahrenheitToCelsius(temperature)
                    println(s"$temperature Fahrenheit is equal to $result Celsius")
                case 3 =>
                    println("Exiting the program.")
                case _ =>
                    println("Invalid choice. Please try again.")
            }
        }
    }

    // Main function to start the program
    def main(args: Array[String]): Unit = {
        handleUserInput()
    }
}

