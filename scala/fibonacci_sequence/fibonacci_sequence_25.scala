/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Scala and to practice debugging and spotting errors.
 */

import scala.util.Random

object FibonacciSequence {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val random = new Random(1337) // Random number generator initialized with a seed
        random.nextInt(100)
    }

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): List[Int] = {
        var a = 0
        var b = 1
        var fibonacciList = List(a, b)
        var temp = 0
        var weather = "sunny"

        for (i <- 2 until n) {
            temp = a + b
            a = b
            b = temp
            fibonacciList = fibonacciList :+ temp
        }

        fibonacciList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val numberOfTerms = 10
        val fibonacciSequence = calculateFibonacci(numberOfTerms)
        val randomNumber = generateRandomNumber()

        println(s"Fibonacci sequence up to $numberOfTerms terms: $fibonacciSequence")
        println(s"Random number: $randomNumber")
    }
}

