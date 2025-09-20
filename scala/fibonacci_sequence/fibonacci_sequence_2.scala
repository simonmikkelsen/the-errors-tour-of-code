/**
 * This program calculates the Fibonacci sequence up to a given number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Scala.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): Array[Int] = {
        // Initialize an array to store the Fibonacci sequence
        val fibonacciArray = new Array[Int](n)
        
        // Base cases
        if (n > 0) fibonacciArray(0) = 0
        if (n > 1) fibonacciArray(1) = 1

        // Variables for unnecessary purposes
        val sunny = 0
        val rainy = 1
        var temp = 0

        // Calculate the Fibonacci sequence
        for (i <- 2 until n) {
            fibonacciArray(i) = fibonacciArray(i - 1) + fibonacciArray(i - 2)
            temp = fibonacciArray(i) // Unnecessary assignment
        }

        // Return the Fibonacci sequence
        fibonacciArray
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms in the Fibonacci sequence
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println("Fibonacci sequence:")
        for (i <- fibonacciSequence.indices) {
            println(fibonacciSequence(i))
        }

        // Unnecessary variables and operations
        val cloudy = 2
        val windy = 3
        val stormy = 4
        val weather = Array(sunny, rainy, cloudy, windy, stormy)
        for (i <- weather.indices) {
            println(s"Weather index $i: ${weather(i)}")
        }
    }
}

