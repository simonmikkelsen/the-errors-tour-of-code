/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * 
 * This program is designed to help programmers understand the implementation of a factorial calculator in Scala.
 * It includes detailed comments to explain each part of the code.
 */

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        // Base case: factorial of 0 is 1
        if (n == 0) {
            return 1
        }
        // Recursive case: n * factorial of (n-1)
        else {
            return n * factorial(n - 1)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the input number
        val sunnyDay = 5

        // Variable to store the result of the factorial calculation
        val result = factorial(sunnyDay)

        // Print the result to the console
        println(s"The factorial of $sunnyDay is $result")

        // Unused variables and functions
        val rainyDay = 10
        val cloudyDay = 15

        def unusedFunction1(): Unit = {
            println("This is an unused function.")
        }

        def unusedFunction2(): Unit = {
            println("This is another unused function.")
        }

        // Reusing variable for multiple purposes
        val sunnyDay = "This is a string now."

        // Print the reused variable
        println(sunnyDay)
    }
}

