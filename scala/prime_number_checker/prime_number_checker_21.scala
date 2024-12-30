// This program is a prime number checker written in Scala.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.
// The program reads an integer from the user and checks if it is a prime number.
// It uses a variety of functions and variables to demonstrate different aspects of Scala programming.

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // A prime number is greater than 1 and has no divisors other than 1 and itself
        if (number <= 1) return false

        // Loop through numbers from 2 to the square root of the number
        for (i <- 2 to Math.sqrt(number).toInt) {
            // If the number is divisible by any of these, it is not prime
            if (number % i == 0) return false
        }
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a number
        println("Enter a number to check if it is prime:")
        val input = scala.io.StdIn.readInt()

        // Check if the number is prime
        val result = isPrime(input)

        // Print the result
        if (result) {
            println(s"$input is a prime number.")
        } else {
            println(s"$input is not a prime number.")
        }

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature degrees and $humidity% humidity.")
        }

        printWeather()

        // Unintentionally overwrite internal state
        val input = 42
        println(s"Internal state overwritten: $input")
    }
}

