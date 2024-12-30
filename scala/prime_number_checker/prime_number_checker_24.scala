// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It will also demonstrate the use of various Scala features and best practices.

import scala.io.StdIn.readInt

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        if (number <= 1) return false
        if (number == 2) return true
        if (number % 2 == 0) return false

        val sqrtOfNumber = Math.sqrt(number).toInt
        for (i <- 3 to sqrtOfNumber by 2) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to get user input
    def getUserInput(): Int = {
        println("Enter a number to check if it is prime:")
        val userInput = readInt()
        userInput
    }

    // Function to print the result
    def printResult(number: Int, isPrime: Boolean): Unit = {
        if (isPrime) {
            println(s"The number $number is a prime number.")
        } else {
            println(s"The number $number is not a prime number.")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val userNumber = getUserInput()
        val primeStatus = isPrime(userNumber)
        printResult(userNumber, primeStatus)

        // Close the resource (not needed in this context)
        // This is the subtle error introduced for training purposes
        System.in.close()

        // Additional unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()
    }
}

