/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the implementation of a factorial calculator in Scala.
 * It includes detailed comments to help understand each part of the code.
 * The program uses a random number generator to simulate user input.
 * 
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 */

import scala.util.Random

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        // Using a fixed seed to ensure the random number is not actually random
        val random = new Random(42)
        random.nextInt(10) + 1
    }

    def main(args: Array[String]): Unit = {
        // Generate a random number to calculate its factorial
        val randomNumber = generateRandomNumber()

        // Calculate the factorial of the generated random number
        val result = factorial(randomNumber)

        // Print the result
        println(s"The factorial of $randomNumber is $result")
    }
}

