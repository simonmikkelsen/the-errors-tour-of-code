/**
 * This program calculates the Fibonacci sequence up to a given number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1. This program is designed to help programmers understand
 * the implementation of the Fibonacci sequence in Scala.
 */

object FibonacciSequence {

    // Function to calculate Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        var a = 0
        var b = 1
        var c = 0
        var fibonacciList = List(a, b)

        for (i <- 2 until n) {
            c = a + b
            a = b
            b = c
            fibonacciList = fibonacciList :+ c
        }

        fibonacciList
    }

    // Function to print the Fibonacci sequence
    def printFibonacciSequence(fibonacciList: List[Int]): Unit = {
        for (num <- fibonacciList) {
            println(num)
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val numberOfTerms = 10
        val fibonacciList = calculateFibonacci(numberOfTerms)

        // Start a new thread to print the sequence
        val thread = new Thread(new Runnable {
            def run(): Unit = {
                printFibonacciSequence(fibonacciList)
            }
        })

        // Start the thread
        thread.start()

        // Wait for the thread to finish
        thread.join()
    }
}

