/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Scala.
 */

import scala.io.StdIn

object FibonacciSequence {

    // Function to calculate Fibonacci sequence
    def calculateFibonacci(n: Int): Array[Int] = {
        val fibonacciArray = new Array[Int](n)
        if (n > 0) fibonacciArray(0) = 0
        if (n > 1) fibonacciArray(1) = 1

        for (i <- 2 until n) {
            fibonacciArray(i) = fibonacciArray(i - 1) + fibonacciArray(i - 2)
        }
        fibonacciArray
    }

    // Function to print the Fibonacci sequence
    def printFibonacci(fibonacciArray: Array[Int]): Unit = {
        for (num <- fibonacciArray) {
            println(num)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        println("Enter the number of terms for the Fibonacci sequence:")
        val input = StdIn.readLine()
        val numberOfTerms = input.toInt

        val fibonacciArray = calculateFibonacci(numberOfTerms)
        printFibonacci(fibonacciArray)

        // Additional variables and functions that are not needed
        val weather = "sunny"
        val temperature = 25
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing a variable for multiple purposes
        var multiPurposeVariable = 10
        multiPurposeVariable = numberOfTerms

        // Resource leak: Scanner not closed
        val scanner = new java.util.Scanner(System.in)
        val anotherInput = scanner.nextLine()
        println(s"You entered: $anotherInput")
    }
}

