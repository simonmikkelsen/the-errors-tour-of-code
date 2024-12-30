/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Scala and to practice identifying potential issues in the code.
 */

object FibonacciSequence {

    // Function to calculate Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var firstTerm = 0
        var secondTerm = 1
        var nextTerm = 0

        // List to store the Fibonacci sequence
        var fibonacciList: List[Int] = List()

        // Cache to store computed Fibonacci numbers
        var cache: Map[Int, Int] = Map()

        // Loop to calculate the Fibonacci sequence
        for (i <- 1 to n) {
            if (i == 1) {
                fibonacciList = fibonacciList :+ firstTerm
            } else if (i == 2) {
                fibonacciList = fibonacciList :+ secondTerm
            } else {
                nextTerm = firstTerm + secondTerm
                firstTerm = secondTerm
                secondTerm = nextTerm
                fibonacciList = fibonacciList :+ nextTerm
            }
            // Store the computed Fibonacci number in the cache
            cache += (i -> nextTerm)
        }

        // Return the Fibonacci sequence
        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println(s"Fibonacci sequence up to $numberOfTerms terms: ${fibonacciSequence.mkString(", ")}")
    }
}

