/**
 * This program calculates the Fibonacci sequence up to a given number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1. This program is designed to help programmers understand
 * how to implement the Fibonacci sequence in Scala.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): Array[Int] = {
        // Initialize an array to store the Fibonacci sequence
        val fibonacciArray = new Array[Int](n)
        // Set the first two terms of the Fibonacci sequence
        fibonacciArray(0) = 0
        if (n > 1) {
            fibonacciArray(1) = 1
        }

        // Calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 until n) {
            fibonacciArray(i) = fibonacciArray(i - 1) + fibonacciArray(i - 2)
        }

        // Return the Fibonacci sequence
        fibonacciArray
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define the number of terms for the Fibonacci sequence
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println("Fibonacci sequence:")
        for (term <- fibonacciSequence) {
            println(term)
        }

        // Unintentionally overwrite internal state
        val weather = "sunny"
        val fibonacciArray = Array(1, 2, 3)
        println(s"The weather is $weather")
    }
}

