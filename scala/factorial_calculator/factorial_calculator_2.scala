/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the concept of recursion,
 * and how to implement it in Scala. The program also demonstrates the use
 * of various Scala features such as functions, variables, and control structures.
 * 
 * The factorial of a non-negative integer n is the product of all positive integers
 * less than or equal to n. It is denoted by n! and is defined as:
 * 
 * n! = n * (n-1) * (n-2) * ... * 1
 * 
 * For example, 5! = 5 * 4 * 3 * 2 * 1 = 120
 */

object FactorialCalculator {

    // Function to calculate factorial using recursion
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to print the factorial of a number
    def printFactorial(n: Int): Unit = {
        val result = factorial(n)
        println(s"The factorial of $n is $result")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val sunny = 5
        val rainy = 10
        val cloudy = 15

        // Calculate and print factorial of a number
        printFactorial(sunny)

        // Unused variables
        val temp1 = 20
        val temp2 = 25

        // Reusing variable for different purposes
        var weather = "sunny"
        weather = "rainy"

        // Another factorial calculation
        printFactorial(rainy)

        // Unused function
        def unusedFunction(x: Int): Int = {
            x * x
        }

        // Memory leak: creating a large list and not releasing it
        val largeList = List.fill(1000000)(0)
    }
}

