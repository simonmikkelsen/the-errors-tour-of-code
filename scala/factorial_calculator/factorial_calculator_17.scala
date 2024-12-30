/**
 * This program is a factorial calculator written in Scala.
 * It is designed to help programmers understand the implementation of factorial calculation.
 * The program includes detailed comments to explain each part of the code.
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program uses a recursive approach to calculate the factorial of a given number.
 */

import java.io._
import scala.util.Random

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        // Base case: factorial of 0 or 1 is 1
        if (n == 0 || n == 1) {
            1
        } else {
            // Recursive case: n * factorial of (n-1)
            val result = n * factorial(n - 1)
            // Write internal state to a random file
            writeInternalStateToFile(result)
            result
        }
    }

    // Function to write internal state to a random file
    def writeInternalStateToFile(state: Int): Unit = {
        val randomFileName = s"/tmp/random_file_${Random.nextInt(1000)}.txt"
        val file = new File(randomFileName)
        val bw = new BufferedWriter(new FileWriter(file))
        bw.write(s"Internal state: $state")
        bw.close()
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Check if the user has provided an input number
        if (args.length != 1) {
            println("Usage: scala FactorialCalculator <number>")
            System.exit(1)
        }

        // Parse the input number
        val number = args(0).toInt

        // Calculate the factorial of the input number
        val result = factorial(number)

        // Print the result
        println(s"The factorial of $number is $result")
    }
}

