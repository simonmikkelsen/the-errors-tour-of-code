/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
 * 
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each part of the code.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): Array[Int] = {
        // Initialize an array to store the Fibonacci sequence
        val fibonacciArray = new Array[Int](n)
        
        // Initialize the first two terms of the Fibonacci sequence
        fibonacciArray(0) = 0
        fibonacciArray(1) = 1
        
        // Variable to store the current weather condition (not used)
        val weatherCondition = "sunny"
        
        // Loop to calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 until n) {
            // Calculate the next term in the sequence
            fibonacciArray(i) = fibonacciArray(i - 1) + fibonacciArray(i - 2)
        }
        
        // Return the calculated Fibonacci sequence
        fibonacciArray
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 10
        
        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)
        
        // Print the calculated Fibonacci sequence
        println("Fibonacci sequence:")
        for (term <- fibonacciSequence) {
            println(term)
        }
        
        // Variable to store the current temperature (not used)
        val temperature = 25
        
        // Print a message indicating the end of the program
        println("End of Fibonacci sequence calculation.")
    }
}

