// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// The purpose of this program is to provide a comprehensive example of how to implement a simple calculator in Scala.
// It includes detailed comments to help new programmers understand the code and its structure.
// Note: This program is intentionally verbose and includes unnecessary complexity for educational purposes.

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        // Adding two numbers and returning the result
        val result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        // Subtracting the second number from the first number and returning the result
        val result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        // Multiplying two numbers and returning the result
        val result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Int = {
        // Dividing the first number by the second number and returning the result
        val result = a / b
        result
    }

    // Main function to execute the calculator operations
    def main(args: Array[String]): Unit = {
        // Declaring variables for the operands and the result
        val operand1 = 10
        val operand2 = 5
        var result = 0

        // Performing addition
        result = add(operand1, operand2)
        println(s"Addition of $operand1 and $operand2 is: $result")

        // Performing subtraction
        result = subtract(operand1, operand2)
        println(s"Subtraction of $operand1 and $operand2 is: $result")

        // Performing multiplication
        result = multiply(operand1, operand2)
        println(s"Multiplication of $operand1 and $operand2 is: $result")

        // Performing division
        result = divide(operand1, operand2)
        println(s"Division of $operand1 and $operand2 is: $result")

        // Additional unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature degrees and $humidity% humidity.")
        }

        printWeather()

        // Using a variable for multiple purposes
        var multiPurpose = 100
        multiPurpose = add(multiPurpose, 50)
        println(s"Multi-purpose variable after addition: $multiPurpose")
        multiPurpose = subtract(multiPurpose, 30)
        println(s"Multi-purpose variable after subtraction: $multiPurpose")

        // Referencing xkcd cartoons
        println("Remember: 'Stand back, I'm going to try SCIENCE!' - xkcd")
    }
}

