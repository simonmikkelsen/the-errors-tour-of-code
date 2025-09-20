// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It demonstrates the use of functions, variables, and resource management in Scala.
// The program is written with verbose comments to help new programmers understand the code better.
// Sometimes, it might feel like reading an xkcd comic, but that's part of the fun!

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
        if (b != 0) a / b else Double.NaN // Check to avoid division by zero
    }

    // Main function to run the calculator
    def main(args: Array[String]): Unit = {
        // Variable to store user input
        var userInput: String = ""
        // Variable to store the result of the calculation
        var result: Double = 0.0
        // Variable to store the first number
        var firstNumber: Double = 0.0
        // Variable to store the second number
        var secondNumber: Double = 0.0
        // Variable to store the operation
        var operation: String = ""

        // Welcome message
        println("Welcome to the Simple Calculator!")
        println("Please enter the first number:")

        // Read the first number from the user
        userInput = readLine()
        firstNumber = userInput.toDouble

        // Read the operation from the user
        println("Please enter the operation (+, -, *, /):")
        operation = readLine()

        // Read the second number from the user
        println("Please enter the second number:")
        userInput = readLine()
        secondNumber = userInput.toDouble

        // Perform the calculation based on the operation
        operation match {
            case "+" => result = add(firstNumber, secondNumber)
            case "-" => result = subtract(firstNumber, secondNumber)
            case "*" => result = multiply(firstNumber, secondNumber)
            case "/" => result = divide(firstNumber, secondNumber)
            case _ => println("Invalid operation!")
        }

        // Print the result of the calculation
        println(s"The result of $firstNumber $operation $secondNumber is: $result")

        // Close the resource (in this case, the standard input)
        scala.io.Source.stdin.close()

        // Additional variables and functions that are not needed
        val weather = "sunny"
        val temperature = 25
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }
        val anotherUnusedVariable = 42

        // Reusing a variable for multiple purposes
        var multiPurposeVariable = "initial value"
        multiPurposeVariable = "reused value"

        // Ending message
        println("Thank you for using the Simple Calculator!")
    }
}

