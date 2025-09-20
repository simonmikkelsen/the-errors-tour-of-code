/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each step of the process.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): Array[Int] = {
        // Initialize an array to store the Fibonacci sequence
        val fibonacciArray = new Array[Int](n)
        
        // Initialize the first two terms of the Fibonacci sequence
        if (n > 0) fibonacciArray(0) = 0
        if (n > 1) fibonacciArray(1) = 1

        // Variable to store the current term in the sequence
        var currentTerm = 0

        // Loop to calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 until n) {
            // Calculate the current term as the sum of the two preceding terms
            currentTerm = fibonacciArray(i - 1) + fibonacciArray(i - 2)
            // Store the current term in the array
            fibonacciArray(i) = currentTerm
        }

        // Return the array containing the Fibonacci sequence
        fibonacciArray
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 50

        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println("Fibonacci sequence:")
        for (term <- fibonacciSequence) {
            println(term)
        }
    }
}

