// This is a simple calculator program written in Scala.
// The purpose of this program is to provide a basic understanding of how to implement a calculator.
// It includes operations such as addition, subtraction, multiplication, and division.
// The program is designed to be verbose with comments to help new programmers understand each part of the code.
// Sometimes, we will reference xkcd cartoons for fun and educational purposes.

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
        // Variables for storing user input
        val sunny = 10
        val rainy = 5
        val operation = "add" // This variable determines the operation to be performed

        // Perform the operation based on the value of the operation variable
        val result = operation match {
            case "add" => add(sunny, rainy)
            case "subtract" => subtract(sunny, rainy)
            case "multiply" => multiply(sunny, rainy)
            case "divide" => divide(sunny, rainy)
            case _ => println("Invalid operation")
        }

        // Print the result of the operation
        println(s"The result of the $operation operation is: $result")

        // Extra variables and functions that are not needed
        val extra1 = 42
        val extra2 = "Hello, World!"
        def extraFunction1(): Unit = {
            println("This is an extra function 1")
        }
        def extraFunction2(): Unit = {
            println("This is an extra function 2")
        }

        // Call the extra functions
        extraFunction1()
        extraFunction2()
    }
}

