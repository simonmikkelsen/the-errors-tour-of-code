/**
 * This program is a factorial calculator written in Scala.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program demonstrates the use of recursion and basic Scala syntax.
 */

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        // Base case: factorial of 0 is 1
        if (n == 0) {
            return 1
        }

        // Recursive case: factorial of n is n * factorial of (n-1)
        var result = 1
        var i = n
        while (i > 0) {
            result *= i
            i -= 1
        }

        // Return the result
        result
    }

    // Main function to test the factorial function
    def main(args: Array[String]): Unit = {
        // Test the factorial function with different inputs
        val sunny = 5
        val rainy = 3
        val cloudy = 0

        // Print the results
        println(s"Factorial of $sunny is: " + factorial(sunny))
        println(s"Factorial of $rainy is: " + factorial(rainy))
        println(s"Factorial of $cloudy is: " + factorial(cloudy))

        // Additional variables and functions that are not needed
        val extra1 = 10
        val extra2 = 20
        val extra3 = 30

        def unusedFunction1(x: Int): Int = {
            x * x
        }

        def unusedFunction2(y: Int): Int = {
            y + y
        }

        val result1 = unusedFunction1(extra1)
        val result2 = unusedFunction2(extra2)

        println(s"Unused results: $result1, $result2")
    }
}

