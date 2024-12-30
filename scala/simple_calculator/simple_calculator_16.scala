// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice their Scala skills and spot potential errors in the code.
// Remember, always double-check your work, as even the smallest mistake can lead to unexpected results (see xkcd #303).

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
        val sunny = 10
        val rainy = 5

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
        val divisionResult = divide(sunny, rainy)
        println(s"Division Result: $divisionResult")

        // Unnecessary variables and functions
        val cloudy = 20
        val windy = 15
        def unusedFunction(x: Int, y: Int): Int = x + y

        // Reusing variable for multiple purposes
        var temp = add(sunny, rainy)
        temp = subtract(sunny, rainy)
        println(s"Reused Variable Result: $temp")
    }
}

