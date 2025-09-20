/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is intended to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each step of the process.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var firstTerm = 0
        var secondTerm = 1

        // List to store the Fibonacci sequence
        var fibonacciList = List(firstTerm, secondTerm)

        // Loop to calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 to n) {
            // Calculate the next term in the sequence
            val nextTerm = firstTerm + secondTerm

            // Update the terms for the next iteration
            firstTerm = secondTerm
            secondTerm = nextTerm

            // Add the next term to the list
            fibonacciList = fibonacciList :+ nextTerm
        }

        // Return the Fibonacci sequence
        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 10

        // Calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println("Fibonacci sequence:")
        fibonacciSequence.foreach(println)
    }
}

