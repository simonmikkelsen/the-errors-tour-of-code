// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will also demonstrate the use of various Scala features and programming constructs.

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(num: Int): Boolean = {
        // A prime number must be greater than 1
        if (num <= 1) return false

        // Check for factors from 2 to the square root of the number
        val sqrtNum = Math.sqrt(num).toInt
        for (i <- 2 to sqrtNum) {
            if (num % i == 0) return false
        }

        // If no factors are found, the number is prime
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the user's input
        var userInput: Int = 0

        // Prompt the user for input
        println("Enter a number to check if it is prime:")
        userInput = scala.io.StdIn.readInt()

        // Check if the input number is prime
        val result = isPrime(userInput)

        // Display the result to the user
        if (result) {
            println(s"The number $userInput is a prime number.")
        } else {
            println(s"The number $userInput is not a prime number.")
        }

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature degrees and $humidity% humidity.")
        }

        printWeather()
    }
}


























