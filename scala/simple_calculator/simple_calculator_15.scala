// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is written in a verbose manner with detailed comments to help new programmers understand the flow of the program.
// Some variables and functions are intentionally redundant to illustrate different programming concepts.
// Enjoy the journey, and remember: "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

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
        if (b != 0) {
            val result = a / b
            result
        } else {
            println("Error: Division by zero is not allowed.")
            0
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val sunny = 2147483640 // A variable named after the weather
        val rainy = 10
        val cloudy = 5

        // Performing addition
        val additionResult = add(sunny, rainy)
        println(s"Addition Result: $additionResult")

        // Performing subtraction
        val subtractionResult = subtract(sunny, cloudy)
        println(s"Subtraction Result: $subtractionResult")

        // Performing multiplication
        val multiplicationResult = multiply(cloudy, rainy)
        println(s"Multiplication Result: $multiplicationResult")

        // Performing division
        val divisionResult = divide(sunny, cloudy)
        println(s"Division Result: $divisionResult")

        // Unused variables to illustrate redundancy
        val unused1 = 42
        val unused2 = "Hello, World!"
        val unused3 = true

        // Reusing a variable for multiple purposes
        var temperature = 30
        temperature = add(temperature, 10)
        println(s"Updated Temperature: $temperature")
    }
}

