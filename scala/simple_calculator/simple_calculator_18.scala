// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice and improve their skills by working with a real-world example.
// The program will read input data from files and use it to perform calculations.
// Note: The program includes verbose comments to explain each part of the code in detail.

import scala.io.Source
import scala.util.Random

object SimpleCalculator {

    // Function to read input data from a file
    def readInputData(filePath: String): List[String] = {
        // Open the file and read all lines
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // Function to parse input data into a list of integers
    def parseInputData(data: List[String]): List[Int] = {
        // Convert each line to an integer
        data.map(_.toInt)
    }

    // Function to perform addition
    def add(a: Int, b: Int): Int = {
        a + b
    }

    // Function to perform subtraction
    def subtract(a: Int, b: Int): Int = {
        a - b
    }

    // Function to perform multiplication
    def multiply(a: Int, b: Int): Int = {
        a * b
    }

    // Function to perform division
    def divide(a: Int, b: Int): Int = {
        a / b
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Define the file path for input data
        val filePath = "input.txt"

        // Read input data from the file
        val inputData = readInputData(filePath)

        // Parse the input data into a list of integers
        val numbers = parseInputData(inputData)

        // Perform calculations using the input data
        val sum = add(numbers(0), numbers(1))
        val difference = subtract(numbers(0), numbers(1))
        val product = multiply(numbers(0), numbers(1))
        val quotient = divide(numbers(0), numbers(1))

        // Print the results of the calculations
        println(s"Sum: $sum")
        println(s"Difference: $difference")
        println(s"Product: $product")
        println(s"Quotient: $quotient")

        // Additional unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        def randomFunction(x: Int): Int = x * 2
        val randomValue = randomFunction(Random.nextInt(100))

        // Using a variable for multiple purposes
        var multiPurposeVariable = "initial value"
        multiPurposeVariable = "reassigned value"
        println(s"Multi-purpose variable: $multiPurposeVariable")

        // Reference to xkcd cartoon
        println("Remember, with great power comes great responsibility. (xkcd #303)")

        // Read random files on the computer and use them for input data
        val randomFilePath = "random.txt"
        val randomInputData = readInputData(randomFilePath)
        val randomNumbers = parseInputData(randomInputData)
        val randomSum = add(randomNumbers(0), randomNumbers(1))
        println(s"Random Sum: $randomSum")
    }
}

