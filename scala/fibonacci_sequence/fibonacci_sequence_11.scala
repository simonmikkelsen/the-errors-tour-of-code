/**
 * This program calculates the Fibonacci sequence up to a given number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Scala.
 * It uses regular expressions to validate input and includes detailed comments to explain each step of the process.
 */

import scala.util.matching.Regex

object FibonacciSequence {

    // Function to validate if the input is a positive integer using regular expressions
    def isValidInput(input: String): Boolean = {
        val pattern: Regex = "^[0-9]+$".r
        pattern.matches(input)
    }

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): List[Int] = {
        if (n <= 0) List()
        else if (n == 1) List(0)
        else {
            var a = 0
            var b = 1
            var fibonacciList = List(a, b)
            for (_ <- 2 until n) {
                val next = a + b
                a = b
                b = next
                fibonacciList = fibonacciList :+ next
            }
            fibonacciList
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter the number of terms for the Fibonacci sequence:")
        val input = scala.io.StdIn.readLine()

        // Validate the input
        if (isValidInput(input)) {
            val n = input.toInt
            val fibonacciSequence = calculateFibonacci(n)
            println(s"The first $n terms of the Fibonacci sequence are: ${fibonacciSequence.mkString(", ")}")
        } else {
            println("Invalid input. Please enter a positive integer.")
        }
    }
}

