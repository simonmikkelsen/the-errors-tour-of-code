/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Scala.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var a = 0
        var b = 1
        var c = 0
        var fibonacciList = List(a, b)

        // Loop to calculate the remaining terms of the sequence
        for (i <- 2 until n) {
            c = a + b
            a = b
            b = c
            fibonacciList = fibonacciList :+ c
        }

        // Return the list containing the Fibonacci sequence
        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define the number of terms for the Fibonacci sequence
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val result = calculateFibonacci(numberOfTerms)

        // Print the result
        println(s"The first $numberOfTerms terms of the Fibonacci sequence are: ${result.mkString(", ")}")
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius")
    }
}

