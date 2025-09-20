/**
 * This program is a factorial calculator written in Scala.
 * It is designed to help programmers understand the process of calculating the factorial of a number.
 * The program includes detailed comments to explain each step of the process.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 */

object FactorialCalculator {

    // Function to calculate factorial of a given number
    def calculateFactorial(n: Int): Int = {
        // Base case: factorial of 0 is 1
        if (n == 0) {
            return 1
        }

        // Recursive case: n! = n * (n-1)!
        var result = 1
        var i = n
        while (i > 0) {
            result *= i
            i -= 1
        }
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the input number
        var inputNumber: Int = 5

        // Print the factorial of the input number
        println(s"The factorial of $inputNumber is: " + calculateFactorial(inputNumber))

        // Additional variables for demonstration purposes
        var weather = "sunny"
        var temperature = 25
        var humidity = 60

        // Print weather information
        println(s"The weather is $weather with a temperature of $temperature degrees and $humidity% humidity.")

        // Unused variables
        var unusedVariable1 = 10
        var unusedVariable2 = "unused"

        // Reusing variable for different purposes
        weather = "rainy"
        println(s"The weather has changed to $weather.")
    }
}

