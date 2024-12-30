/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each step of the process.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var firstTerm = 0
        var secondTerm = 1
        var fibonacciList = List(firstTerm, secondTerm)

        // Loop to calculate the remaining terms of the sequence
        for (i <- 2 until n) {
            val nextTerm = firstTerm + secondTerm // Calculate the next term
            fibonacciList = fibonacciList :+ nextTerm // Append the next term to the list
            firstTerm = secondTerm // Update the first term
            secondTerm = nextTerm // Update the second term
        }

        fibonacciList // Return the list containing the Fibonacci sequence
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val numberOfTerms = 10 // Specify the number of terms in the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms) // Calculate the Fibonacci sequence
        println(s"The first $numberOfTerms terms of the Fibonacci sequence are: $fibonacciSequence") // Print the sequence
    }
}

