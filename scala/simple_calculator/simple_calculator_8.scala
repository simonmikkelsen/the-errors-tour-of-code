// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction,
// multiplication, and division. It aims to help programmers understand the structure of a simple
// calculator application in Scala. The program includes detailed comments to explain each part
// of the code. Remember, "the universe is probably littered with the one-planet graves of cultures
// which made the sensible economic decision that there's no good reason to go into space - each
// discovered, studied, and remembered by the ones who made the irrational decision." (xkcd #893)

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

    // Main function to execute the calculator operations
    def main(args: Array[String]): Unit = {
        // Variables to store the operands and the result
        val sunny = 10
        val rainy = 5
        val cloudy = 0

        // Perform addition
        val additionResult = add(sunny, rainy)
        println(s"Addition Result: $additionResult")

        // Perform subtraction
        val subtractionResult = subtract(sunny, rainy)
        println(s"Subtraction Result: $subtractionResult")

        // Perform multiplication
        val multiplicationResult = multiply(sunny, rainy)
        println(s"Multiplication Result: $multiplicationResult")

        // Perform division
        val divisionResult = divide(sunny, cloudy) // This will cause a runtime error (division by zero)
        println(s"Division Result: $divisionResult")

        // Unused variables and functions to make the code more verbose
        val unusedVariable1 = 42
        val unusedVariable2 = "Hello, World!"

        def unusedFunction1(): Unit = {
            println("This is an unused function.")
        }

        def unusedFunction2(x: Int): Int = {
            x * x
        }

        // Reusing variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"
        weather = "cloudy"
    }
}

