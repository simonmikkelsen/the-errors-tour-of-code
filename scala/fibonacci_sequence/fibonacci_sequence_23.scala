/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Scala and to practice debugging and code review skills.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var a = 0
        var b = 1
        var c = 0
        var fibonacciList = List(a, b)

        // Loop to calculate the remaining terms
        for (i <- 2 until n) {
            c = a + b
            a = b
            b = c
            fibonacciList = fibonacciList :+ c
        }

        // Return the list containing the Fibonacci sequence
        fibonacciList
    }

    // Function to print the Fibonacci sequence
    def printFibonacci(fibonacciList: List[Int]): Unit = {
        println("Fibonacci sequence:")
        for (num <- fibonacciList) {
            println(num)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms in the Fibonacci sequence
        val numberOfTerms = 10

        // Calculate the Fibonacci sequence
        val fibonacciList = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        printFibonacci(fibonacciList)

        // Self-modifying code (error)
        val sourceCode = scala.io.Source.fromFile("FibonacciSequence.scala").mkString
        val modifiedCode = sourceCode.replace("val numberOfTerms = 10", "val numberOfTerms = 20")
        import java.nio.file.{Files, Paths}
        Files.write(Paths.get("FibonacciSequence.scala"), modifiedCode.getBytes)
    }
}

