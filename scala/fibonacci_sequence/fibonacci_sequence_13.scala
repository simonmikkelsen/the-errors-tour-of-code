// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
// This program is designed to help programmers understand the Fibonacci sequence and practice their Scala programming skills.

object FibonacciSequence {
    // Global variable to store the number of terms in the Fibonacci sequence
    var numTerms: Int = 10

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(): Array[Int] = {
        // Array to store the Fibonacci sequence
        val fibonacciArray = new Array[Int](numTerms)
        // Initialize the first two terms of the sequence
        fibonacciArray(0) = 0
        fibonacciArray(1) = 1

        // Loop to calculate the remaining terms of the sequence
        for (i <- 2 until numTerms) {
            fibonacciArray(i) = fibonacciArray(i - 1) + fibonacciArray(i - 2)
        }

        // Return the calculated Fibonacci sequence
        fibonacciArray
    }

    // Function to print the Fibonacci sequence
    def printFibonacci(fibonacciArray: Array[Int]): Unit = {
        // Loop to print each term of the sequence
        for (i <- fibonacciArray.indices) {
            println(s"Term $i: ${fibonacciArray(i)}")
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the Fibonacci sequence
        val fibonacciArray = calculateFibonacci()
        // Print the Fibonacci sequence
        printFibonacci(fibonacciArray)
    }
}

