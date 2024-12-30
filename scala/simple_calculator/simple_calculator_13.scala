// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers understand the structure of a simple calculator program in Scala.
// The program uses a global variable to store the result of the calculations, which can be accessed and modified by various functions.
// Note: This program includes verbose comments to explain each part of the code in detail.

object SimpleCalculator {
    // Global variable to store the result of calculations
    var result: Double = 0.0

    // Function to add two numbers
    def add(a: Double, b: Double): Double = {
        result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Double, b: Double): Double = {
        result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Double, b: Double): Double = {
        result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Double, b: Double): Double = {
        if (b != 0) {
            result = a / b
        } else {
            println("Error: Division by zero is not allowed.")
        }
        result
    }

    // Function to reset the result to zero
    def reset(): Unit = {
        result = 0.0
    }

    // Main function to demonstrate the usage of the calculator functions
    def main(args: Array[String]): Unit = {
        // Variables for demonstration purposes
        val sunny = 10.0
        val rainy = 5.0
        val cloudy = 2.0

        // Perform some calculations
        println(s"Addition: ${add(sunny, rainy)}")
        println(s"Subtraction: ${subtract(sunny, cloudy)}")
        println(s"Multiplication: ${multiply(rainy, cloudy)}")
        println(s"Division: ${divide(sunny, cloudy)}")

        // Reset the result
        reset()
        println(s"Result after reset: $result")
    }
}

