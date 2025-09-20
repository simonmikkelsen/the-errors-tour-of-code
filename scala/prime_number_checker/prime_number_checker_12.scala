/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The program includes detailed comments to help understand the logic and flow of the code.
 * It also includes some additional variables and functions to illustrate different programming concepts.
 */

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // A prime number is greater than 1
        if (number <= 1) return false

        // Check for factors from 2 to the square root of the number
        for (i <- 2 to Math.sqrt(number).toInt) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to get user input
    def getUserInput(): Int = {
        println("Enter a number to check if it is prime:")
        scala.io.StdIn.readInt()
    }

    // Function to print the result
    def printResult(number: Int, isPrime: Boolean): Unit = {
        if (isPrime) {
            println(s"$number is a prime number.")
        } else {
            println(s"$number is not a prime number.")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Get user input
        val userInput = getUserInput()

        // Check if the number is prime
        val primeStatus = isPrime(userInput)

        // Print the result
        printResult(userInput, primeStatus)

        // Unnecessary caching of data in memory
        val cache = scala.collection.mutable.Map[Int, Boolean]()
        cache(userInput) = primeStatus
    }
}

