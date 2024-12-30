/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the Fibonacci sequence
 * and how to implement it in Scala. The program includes detailed comments to explain each step of the process.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        val firstTerm = 0
        val secondTerm = 1

        // Initialize a list to store the Fibonacci sequence
        var fibonacciList: List[Int] = List(firstTerm, secondTerm)

        // Initialize variables for the current and next terms
        var currentTerm = firstTerm
        var nextTerm = secondTerm

        // Loop to calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 until n) {
            // Calculate the next term in the sequence
            val newTerm = currentTerm + nextTerm

            // Update the current and next terms
            currentTerm = nextTerm
            nextTerm = newTerm

            // Add the new term to the list
            fibonacciList = fibonacciList :+ newTerm
        }

        // Return the Fibonacci sequence
        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define the number of terms to calculate
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println(s"The Fibonacci sequence up to $numberOfTerms terms is: ${fibonacciSequence.mkString(", ")}")
    }
}

