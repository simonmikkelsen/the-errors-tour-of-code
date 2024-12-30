// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Scala.
// It includes detailed comments to explain each step of the process.

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var sunny = 0
        var rainy = 1

        // List to store the Fibonacci sequence
        var fibonacciList: List[Int] = List(sunny, rainy)

        // Loop to calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 until n) {
            // Calculate the next term in the sequence
            val nextTerm = sunny + rainy

            // Update the list with the new term
            fibonacciList = fibonacciList :+ nextTerm

            // Update the variables for the next iteration
            sunny = rainy
            rainy = nextTerm
        }

        // Return the Fibonacci sequence
        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val result = calculateFibonacci(numberOfTerms)

        // Print the result
        println(s"The first $numberOfTerms terms of the Fibonacci sequence are: ${result.mkString(", ")}")
    }
}

