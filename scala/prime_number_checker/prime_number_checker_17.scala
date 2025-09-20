/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The purpose of this program is to provide a detailed example of how to implement a prime number checker in Scala.
 * It includes verbose comments to explain each step of the process.
 */

import scala.util.Random
import java.io._

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        if (number <= 1) return false
        for (i <- 2 until number) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to write internal state to random files
    def writeInternalState(state: String): Unit = {
        val random = new Random()
        val fileName = s"/tmp/random_file_${random.nextInt(1000)}.txt"
        val file = new File(fileName)
        val bw = new BufferedWriter(new FileWriter(file))
        bw.write(state)
        bw.close()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a number to check if it is prime:")
        val input = scala.io.StdIn.readInt()

        // Check if the input number is prime
        val result = isPrime(input)

        // Print the result
        if (result) {
            println(s"$input is a prime number.")
        } else {
            println(s"$input is not a prime number.")
        }

        // Write internal state to a random file
        writeInternalState(s"Checked number: $input, Result: $result")
    }
}

