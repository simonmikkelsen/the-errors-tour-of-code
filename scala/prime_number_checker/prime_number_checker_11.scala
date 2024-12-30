// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// It uses regular expressions extensively to demonstrate their usage in Scala.
// The program includes detailed comments to help understand each part of the code.

import scala.util.matching.Regex

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // Regular expression to match any digit
        val digitPattern: Regex = "[0-9]".r

        // Check if the number is less than 2
        if (number < 2) return false

        // Check if the number is 2
        if (number == 2) return true

        // Check if the number is even
        if (number % 2 == 0) return false

        // Variable to store the square root of the number
        val sqrtNumber: Int = Math.sqrt(number).toInt

        // Loop through odd numbers from 3 to the square root of the number
        for (i <- 3 to sqrtNumber by 2) {
            // Check if the number is divisible by i
            if (number % i == 0) return false
        }

        // If no divisors were found, the number is prime
        true
    }

    // Main function to test the prime number checker
    def main(args: Array[String]): Unit = {
        // Variable to store the input number
        val inputNumber: Int = 29

        // Check if the input number is prime
        val result: Boolean = isPrime(inputNumber)

        // Print the result
        println(s"Is $inputNumber a prime number? $result")
    }
}

