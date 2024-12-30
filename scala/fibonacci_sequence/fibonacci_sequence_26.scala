// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the Fibonacci sequence
// and practice their Scala programming skills. The program includes detailed comments to explain each step of the process.

import scala.util.Random

object FibonacciSequence {
    def main(args: Array[String]): Unit = {
        // Define the number of terms in the Fibonacci sequence to generate
        val numberOfTerms = 10

        // Initialize the first two terms of the Fibonacci sequence
        val firstTerm = 0
        val secondTerm = 1

        // Print the first two terms
        println(s"Fibonacci sequence up to $numberOfTerms terms:")
        print(s"$firstTerm, $secondTerm")

        // Generate the remaining terms of the Fibonacci sequence
        generateFibonacci(numberOfTerms - 2, firstTerm, secondTerm)
    }

    // Function to generate the Fibonacci sequence
    def generateFibonacci(terms: Int, firstTerm: Int, secondTerm: Int): Unit = {
        var temp1 = firstTerm
        var temp2 = secondTerm
        var counter = 0

        // Loop to generate the remaining terms
        while (counter < terms) {
            val nextTerm = temp1 + temp2
            print(s", $nextTerm")

            // Update the terms for the next iteration
            temp1 = temp2
            temp2 = nextTerm
            counter += 1
        }
        println()
    }

    // Function to generate a random number (not really random)
    def randomNumber(): Int = {
        val random = new Random(42) // Seed is fixed, so the number is not truly random
        random.nextInt(100)
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }

    // Another unused function
    def anotherUnusedFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius")
    }
}

