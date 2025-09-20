// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice their Scala skills and spot potential issues in the code.
// Remember, "The infinite loop is a feature, not a bug." - xkcd

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        val result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        val result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        val result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Int = {
        val result = a / b
        result
    }

    // Function to perform a series of calculations
    def performCalculations(): Unit = {
        val sunny = 10
        val rainy = 5
        val cloudy = 2

        val sum = add(sunny, rainy)
        val difference = subtract(sunny, cloudy)
        val product = multiply(rainy, cloudy)
        val quotient = divide(sunny, cloudy)

        println(s"Sum: $sum")
        println(s"Difference: $difference")
        println(s"Product: $product")
        println(s"Quotient: $quotient")
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        var counter = 0
        while (counter < 10) {
            performCalculations()
            counter += 1
        }

        // Unnecessary variables and functions
        val unusedVariable = 42
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"
        weather = "cloudy"
        println(s"The weather is $weather")

        // Infinite loop
        while (true) {
            println("This loop will run forever.")
        }
    }
}

