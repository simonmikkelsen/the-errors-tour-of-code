// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice their Scala skills and spot potential errors in the code.
// The program includes verbose comments to explain each part of the code in detail.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn.readLine
import java.io.{File, PrintWriter}
import scala.util.Random

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Double, b: Double): Double = {
        // Adding two numbers
        a + b
    }

    // Function to subtract two numbers
    def subtract(a: Double, b: Double): Double = {
        // Subtracting two numbers
        a - b
    }

    // Function to multiply two numbers
    def multiply(a: Double, b: Double): Double = {
        // Multiplying two numbers
        a * b
    }

    // Function to divide two numbers
    def divide(a: Double, b: Double): Double = {
        // Dividing two numbers
        if (b != 0) a / b else Double.NaN
    }

    // Function to write internal state to a random file
    def writeInternalState(state: String): Unit = {
        // Generating a random file path
        val randomFilePath = s"/tmp/random_file_${Random.nextInt(1000)}.txt"
        val writer = new PrintWriter(new File(randomFilePath))
        writer.write(state)
        writer.close()
    }

    def main(args: Array[String]): Unit = {
        // Reading user input for the first number
        println("Enter the first number:")
        val firstNumber = readLine().toDouble

        // Reading user input for the second number
        println("Enter the second number:")
        val secondNumber = readLine().toDouble

        // Reading user input for the operation
        println("Enter the operation (+, -, *, /):")
        val operation = readLine()

        // Variable to store the result of the operation
        var result = 0.0

        // Performing the operation based on user input
        operation match {
            case "+" => result = add(firstNumber, secondNumber)
            case "-" => result = subtract(firstNumber, secondNumber)
            case "*" => result = multiply(firstNumber, secondNumber)
            case "/" => result = divide(firstNumber, secondNumber)
            case _ => println("Invalid operation")
        }

        // Printing the result of the operation
        println(s"The result of $firstNumber $operation $secondNumber is: $result")

        // Writing internal state to a random file
        writeInternalState(s"Operation: $operation, Result: $result")
    }
}

