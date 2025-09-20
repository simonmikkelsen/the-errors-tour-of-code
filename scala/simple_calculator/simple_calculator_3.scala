// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice their Scala skills and understand the structure of a simple calculator application.
// The program includes verbose comments to explain each part of the code in detail.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Double, b: Double): Double = {
        val result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Double, b: Double): Double = {
        val result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Double, b: Double): Double = {
        val result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Double, b: Double): Double = {
        val result = a / b
        result
    }

    // Main function to execute the calculator program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter the first number
        println("Enter the first number:")
        val firstNumber = StdIn.readLine().toDouble

        // Prompt the user to enter the second number
        println("Enter the second number:")
        val secondNumber = StdIn.readLine().toDouble

        // Prompt the user to enter the operation
        println("Enter the operation (+, -, *, /):")
        val operation = StdIn.readLine()

        // Variable to store the result of the calculation
        var result = 0.0

        // Perform the calculation based on the operation entered by the user
        operation match {
            case "+" => result = add(firstNumber, secondNumber)
            case "-" => result = subtract(firstNumber, secondNumber)
            case "*" => result = multiply(firstNumber, secondNumber)
            case "/" => result = divide(firstNumber, secondNumber)
            case _ => println("Invalid operation")
        }

        // Print the result of the calculation
        println(s"The result of the calculation is: $result")

        // Open a file to write the result (this is where the resource leak occurs)
        val file = new java.io.PrintWriter("result.txt")
        file.write(s"The result of the calculation is: $result")
        // The file is not closed, leading to a resource leak
    }
}

