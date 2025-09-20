// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will use a simple algorithm to check for primality by testing divisibility from 2 up to the square root of the number.
// The program includes detailed comments to help understand the logic and flow of the code.

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(num: Int): Boolean = {
        // A prime number must be greater than 1
        if (num <= 1) return false

        // Variable to store the square root of the number
        val sqrtNum = Math.sqrt(num).toInt

        // Loop through all numbers from 2 to the square root of the number
        for (i <- 2 to sqrtNum + 1) {
            // If the number is divisible by any of these numbers, it is not prime
            if (num % i == 0) return false
        }

        // If no divisors were found, the number is prime
        true
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Variable to store the user's input
        var userInput = 0

        // Prompt the user to enter a number
        println("Please enter a number to check if it is prime:")

        // Read the user's input
        userInput = scala.io.StdIn.readInt()

        // Check if the number is prime and print the result
        if (isPrime(userInput)) {
            println(s"The number $userInput is a prime number.")
        } else {
            println(s"The number $userInput is not a prime number.")
        }
    }
}

