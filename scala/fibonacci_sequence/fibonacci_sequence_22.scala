// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence in Scala and to practice debugging skills.

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var firstTerm = 0
        var secondTerm = 1

        // List to store the Fibonacci sequence
        var fibonacciList: List[Int] = List()

        // Loop to calculate the Fibonacci sequence up to n terms
        for (i <- 1 to n) {
            // Add the current term to the list
            fibonacciList = fibonacciList :+ firstTerm

            // Calculate the next term
            val nextTerm = firstTerm + secondTerm

            // Update the terms
            firstTerm = secondTerm
            secondTerm = nextTerm
        }

        // Return the Fibonacci sequence
        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 10

        // Call the function to calculate the Fibonacci sequence
        val fibonacciSequence = calculateFibonacci(numberOfTerms)

        // Print the Fibonacci sequence
        println("Fibonacci sequence:")
        fibonacciSequence.foreach(println)

        // Additional variables and functions that are not needed
        val weather = "sunny"
        def printWeather(): Unit = {
            println(s"The weather is $weather")
        }
        printWeather()

        // Using a variable for multiple purposes
        var temperature = 25
        temperature = fibonacciSequence.sum
        println(s"The sum of the Fibonacci sequence is $temperature")
    }
}

