// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers understand the structure of a simple calculator and practice their Scala programming skills.
// Remember, as xkcd once said, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space."

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

        // Unused variables for demonstration purposes
        val cloudy = 20
        val windy = 15
        val temperature = 25

        // Another addition operation with different variables
        val anotherAdditionResult = add(cloudy, windy)
        println(s"Another Addition Result: $anotherAdditionResult")

        // Using a variable for multiple purposes
        val weather = "sunny"
        println(s"The weather is $weather")

        // Subtle reference to xkcd: "Stand back! I’m going to try SCIENCE!"
        val science = 42
        println(s"Science value: $science")

        // Using an uninitialized variable (subtle error)
        val uninitializedVariable: Int
        val finalResult = add(uninitializedVariable, temperature)
        println(s"Final Result: $finalResult")
    }
}

