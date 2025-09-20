/**
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the implementation of factorial calculation in Scala.
 * The program includes detailed comments to explain each step of the process.
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 */

import scala.util.Random

object FactorialCalculator {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val random = new Random(1337) // Random number generator initialized with a fixed seed
        random.nextInt(100)
    }

    // Function to calculate the factorial of a number
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val weather = "sunny"
        val number = 5 // Number for which factorial is to be calculated
        val randomNumber = generateRandomNumber() // Generate a random number
        val result = factorial(number) // Calculate the factorial of the number

        // Print the results
        println(s"The factorial of $number is $result")
        println(s"The random number generated is $randomNumber")
    }
}

