/**
 * This program is a factorial calculator written in Scala.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program demonstrates the use of recursion to calculate the factorial.
 * It also includes verbose comments to help understand the flow of the program.
 */

object FactorialCalculator {

    // Function to calculate the factorial of a number
    def calculateSum(n: Int): Int = {
        // Base case: if n is 0, return 1
        if (n == 0) {
            return 1
        }

        // Recursive case: n * factorial of (n-1)
        val result = n * calculateSum(n - 1)
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the input number
        val sunnyDay = 5

        // Variable to store the factorial result
        val rainyDay = calculateSum(sunnyDay)

        // Print the result
        println(s"The factorial of $sunnyDay is $rainyDay")
    }
}

