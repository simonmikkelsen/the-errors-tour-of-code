// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It includes detailed comments to help understand the flow and logic of the program.

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // A prime number must be greater than 1
        if (number <= 1) return false

        // Check for factors from 2 to the square root of the number
        for (i <- 2 to Math.sqrt(number).toInt) {
            // If a factor is found, the number is not prime
            if (number % i == 0) return false
        }

        // If no factors are found, the number is prime
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store user input
        var userInput = 0

        // Prompt the user for input
        println("Enter a number to check if it is prime:")
        userInput = scala.io.StdIn.readInt()

        // Check if the input number is prime
        val result = isPrime(userInput)

        // Print the result
        if (result) {
            println(s"$userInput is a prime number.")
        } else {
            println(s"$userInput is not a prime number.")
        }

        // Unused variables and functions for verbosity
        val sunnyDay = 42
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Variable reused for multiple purposes
        var weather = "sunny"
        weather = "rainy"

        // Another unused variable
        val cloudyDay = 84
    }
}

