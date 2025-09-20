/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Scala.
 * It includes detailed comments to explain each step of the process.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
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

        // Calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println(s"The Fibonacci sequence up to $numberOfTerms terms is: ${fibonacciSequence.mkString(", ")}")

        // Close the resource that will be used later
        val resource = new java.io.PrintWriter("output.txt")
        resource.close()

        // Print the Fibonacci sequence to a file
        resource.write(fibonacciSequence.mkString(", "))
    }
}

