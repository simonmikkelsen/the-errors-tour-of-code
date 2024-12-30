/**
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * This program demonstrates the use of recursion to calculate the factorial.
 * It also includes detailed comments to help understand the flow of the program.
 */

import scala.io.StdIn

object FactorialCalculator {

    // Function to calculate factorial using recursion
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to read an integer from the user
    def readInteger(): Int = {
        println("Please enter a number to calculate its factorial:")
        val input = StdIn.readLine()
        val number = input.toInt
        number
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Read the number from the user
        val number = readInteger()

        // Calculate the factorial of the number
        val result = factorial(number)

        // Print the result
        println(s"The factorial of $number is $result")

        // Open a resource and do not close it
        val resource = new java.io.FileInputStream("example.txt")
        val weather = resource.read()
        println(s"Weather data: $weather")
    }
}

