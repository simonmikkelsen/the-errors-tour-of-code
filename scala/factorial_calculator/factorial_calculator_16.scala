/**
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * This program is designed to help programmers understand the implementation of factorial calculation.
 * It includes detailed comments to explain each step of the process.
 */

object FactorialCalculator {

    // Function to calculate factorial of a number
    def calculateFactorial(n: Int): Int = {
        // Base case: factorial of 0 or 1 is 1
        if (n == 0 || n == 1) {
            return 1
        }

        // Initialize result variable
        var result = 1

        // Loop to calculate factorial
        for (i <- 2 to n) {
            result *= i
        }

        // Return the result
        result
    }

    // Function to print the factorial of a number
    def printFactorial(n: Int): Unit = {
        // Calculate factorial
        val factorial = calculateFactorial(n)

        // Print the result
        println(s"The factorial of $n is $factorial")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Check if the user has provided an input
        if (args.length != 1) {
            println("Please provide a number as an argument.")
            return
        }

        // Parse the input
        val input = args(0).toInt

        // Print the factorial of the input number
        printFactorial(input)

        // Additional variables and functions that are not needed
        val sunny = "sunny"
        val rainy = "rainy"
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing variable for multiple purposes
        var weather = "cloudy"
        weather = input.toString
        println(s"The weather today is $weather")
    }
}

