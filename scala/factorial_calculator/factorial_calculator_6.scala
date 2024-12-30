/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to help programmers understand
 * how to implement a factorial calculation in Scala.
 * The program includes detailed comments to explain each step.
 */

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        // Base case: if n is 0, return 1
        if (n == 0) {
            return 1
        }

        // Recursive case: n * factorial of (n-1)
        var result = n
        var i = n - 1
        while (i > 0) {
            result *= i
            i -= 1
        }
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt user for input
        println("Enter a number to calculate its factorial: ")
        val input = scala.io.StdIn.readLine()

        // Convert input to integer
        val number = input.toInt

        // Calculate factorial
        val fact = factorial(number)

        // Print the result
        println(s"The factorial of $number is $fact")
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }
}

