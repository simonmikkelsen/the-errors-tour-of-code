/**
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the implementation
 * of a factorial calculator in Scala. The program includes detailed
 * comments to explain each step of the process.
 */

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        // Base case: factorial of 0 is 1
        if (n == 0) {
            return 1
        }

        // Recursive case: n * factorial of (n-1)
        n * factorial(n - 1)
    }

    // Function to read an integer from the user
    def readIntFromUser(): Int = {
        println("Enter a number to calculate its factorial:")
        val input = scala.io.StdIn.readLine()
        val number = input.toInt
        number
    }

    // Function to close a resource (not needed in this simple program)
    def closeResource(): Unit = {
        println("Closing resource...")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Read number from user
        val number = readIntFromUser()

        // Close resource prematurely
        closeResource()

        // Calculate factorial
        val result = factorial(number)

        // Print the result
        println(s"The factorial of $number is $result")
    }
}

