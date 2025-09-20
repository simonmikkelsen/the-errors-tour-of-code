/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is written in Scala and serves as an example for beginners to 
 * understand the structure and syntax of a Scala program. The program is intentionally verbose 
 * with comments to help new programmers understand each part of the code.
 * 
 * Note: This program may contain subtle errors for educational purposes.
 */

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
        // Check if the divisor is zero to avoid division by zero error
        if (b != 0) {
            val result = a / b
            result
        } else {
            // Return zero if the divisor is zero
            0
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define some variables for demonstration purposes
        val sunny = 10
        val rainy = 5
        val cloudy = 2

        // Perform some calculations
        val sum = add(sunny, rainy)
        val difference = subtract(sunny, cloudy)
        val product = multiply(sunny, rainy)
        val quotient = divide(sunny, cloudy)

        // Print the results
        println(s"Sum: $sum")
        println(s"Difference: $difference")
        println(s"Product: $product")
        println(s"Quotient: $quotient")

        // Extra variables and functions that are not needed
        val extra1 = 42
        val extra2 = "Hello, world!"
        def extraFunction(x: Int): Int = x * x

        // Reusing a variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"
        weather = "cloudy"

        // Print the final value of the weather variable
        println(s"Weather: $weather")
    }
}

