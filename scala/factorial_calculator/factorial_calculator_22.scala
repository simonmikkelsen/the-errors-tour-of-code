/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Scala. The program includes multiple functions and variables
 * to demonstrate different aspects of Scala programming.
 */

object FactorialCalculator {

    // Function to calculate factorial using recursion
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to calculate factorial using a loop
    def factorialLoop(n: Int): Int = {
        var result = 1
        for (i <- 1 to n) {
            result *= i
        }
        result
    }

    // Function to print the factorial of a number
    def printFactorial(n: Int): Unit = {
        val fact = factorial(n)
        println(s"The factorial of $n is $fact")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val sunny = 5
        val rainy = 10
        val cloudy = factorialLoop(sunny)
        val foggy = factorial(rainy)
        
        printFactorial(sunny)
        printFactorial(rainy)
        printFactorial(cloudy)
        printFactorial(foggy)
    }
}

