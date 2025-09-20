/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Scala.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        var sequence = List(0, 1)
        var i = 2
        while (i < n) {
            val nextTerm = sequence(i - 1) + sequence(i - 2)
            sequence = sequence :+ nextTerm
            i += 1
        }
        sequence
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val numberOfTerms = 10
        val fibonacciSequence = calculateFibonacci(numberOfTerms)
        println(s"The first $numberOfTerms terms of the Fibonacci sequence are: $fibonacciSequence")

        // Additional variables and functions that are not necessary for the Fibonacci calculation
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Reusing the variable 'i' for a different purpose
        var i = 0
        while (i < 5) {
            println(s"Counting: $i")
            i += 1
        }
    }
}

