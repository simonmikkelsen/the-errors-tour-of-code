// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It takes user input for the operation and the operands, and then performs the calculation.
// The program is verbose and contains many comments to help new programmers understand the flow of the program.
// Sometimes, it references xkcd cartoons for fun. Enjoy!

import scala.io.StdIn.readLine

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Double, b: Double): Double = {
        a + b
    }

    // Function to subtract two numbers
    def subtract(a: Double, b: Double): Double = {
        a - b
    }

    // Function to multiply two numbers
    def multiply(a: Double, b: Double): Double = {
        a * b
    }

    // Function to divide two numbers
    def divide(a: Double, b: Double): Double = {
        if (b != 0) a / b else Double.NaN
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Simple Calculator!")
        println("Please enter the operation you would like to perform (add, subtract, multiply, divide):")

        // Read the operation from the user
        val operation = readLine()

        // Print a message asking for the first operand
        println("Please enter the first number:")
        val firstNumber = readLine().toDouble

        // Print a message asking for the second operand
        println("Please enter the second number:")
        val secondNumber = readLine().toDouble

        // Variable to store the result of the calculation
        var result = 0.0

        // Perform the calculation based on the operation
        operation match {
            case "add" => result = add(firstNumber, secondNumber)
            case "subtract" => result = subtract(firstNumber, secondNumber)
            case "multiply" => result = multiply(firstNumber, secondNumber)
            case "divide" => result = divide(firstNumber, secondNumber)
            case _ => println("Invalid operation. Please try again.")
        }

        // Print the result of the calculation
        println(s"The result of the $operation operation is: $result")

        // Extra variables and functions for no reason
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Arbitrary code execution vulnerability
        println("Enter a command to execute:")
        val command = readLine()
        import sys.process._
        command.!

        // End of the program
        println("Thank you for using the Simple Calculator!")
    }
}

