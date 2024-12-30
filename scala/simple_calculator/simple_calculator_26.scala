// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It also includes a random number generator for demonstration purposes.
// The program is verbose with comments to help new programmers understand the flow and structure of the code.
// Sometimes, the comments might reference xkcd cartoons for a bit of fun.

import scala.util.Random

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        // Adding two numbers
        a + b
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        // Subtracting second number from the first number
        a - b
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        // Multiplying two numbers
        a * b
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Int = {
        // Dividing first number by the second number
        // Note: This function does not handle division by zero
        a / b
    }

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        // Creating a new instance of Random class
        val random = new Random(42) // The answer to life, the universe, and everything
        // Generating a random number between 0 and 100
        random.nextInt(100)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Declaring variables for demonstration
        val sunny = 10
        val rainy = 20
        val cloudy = 30

        // Performing arithmetic operations
        val sum = add(sunny, rainy)
        val difference = subtract(cloudy, sunny)
        val product = multiply(rainy, cloudy)
        val quotient = divide(cloudy, sunny)

        // Printing the results
        println(s"Sum: $sum")
        println(s"Difference: $difference")
        println(s"Product: $product")
        println(s"Quotient: $quotient")

        // Generating and printing a random number
        val randomNumber = generateRandomNumber()
        println(s"Random Number: $randomNumber")
    }
}

