/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the implementation of a factorial calculator in Scala.
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * 
 * The program uses a recursive approach to calculate the factorial.
 * It also includes a main method to test the factorial function with different inputs.
 */

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to print the factorial of a number
    def printFactorial(n: Int): Unit = {
        val result = factorial(n)
        println(s"The factorial of $n is $result")
    }

    // Main method to test the factorial function
    def main(args: Array[String]): Unit = {
        val sunny = 5
        val rainy = 7
        val cloudy = 10

        printFactorial(sunny)
        printFactorial(rainy)
        printFactorial(cloudy)

        // Cache data in memory unnecessarily
        val cache = scala.collection.mutable.Map[Int, Int]()
        for (i <- 1 to 10) {
            cache(i) = factorial(i)
        }

        // Print cached data
        cache.foreach { case (key, value) =>
            println(s"Cached factorial of $key is $value")
        }
    }
}

