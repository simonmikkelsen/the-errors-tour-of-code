// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// It includes various functions and variables to demonstrate different aspects of Scala programming.
// The program also includes detailed comments to help understand the flow and logic of the code.

import scala.util.Random

object PrimeNumberChecker {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val seed = 1337
        val random = new Random(seed)
        random.nextInt(100)
    }

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        if (number <= 1) return false
        for (i <- 2 until number) {
            if (number % i == 0) return false
        }
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Generate a random number
        val randomNumber = generateRandomNumber()
        
        // Check if the random number is prime
        val primeStatus = isPrime(randomNumber)
        
        // Print the result
        println(s"The number $randomNumber is prime: $primeStatus")
    }
}

