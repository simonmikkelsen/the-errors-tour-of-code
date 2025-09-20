/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * 
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will provide detailed feedback on the process of checking for primality.
 * 
 * The program includes various functions and variables to demonstrate different aspects of Scala programming.
 */

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // Early return for numbers less than 2
        if (number < 2) return false

        // Loop through possible divisors
        var i = 2
        while (i <= number / 2) {
            if (number % i == 0) return false
            i += 1
        }
        true
    }

    // Function to get user input
    def getUserInput(): Int = {
        println("Enter a number to check if it is prime:")
        scala.io.StdIn.readInt()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val userInput = getUserInput()
        val result = isPrime(userInput)
        if (result) {
            println(s"The number $userInput is a prime number.")
        } else {
            println(s"The number $userInput is not a prime number.")
        }
    }

    // Additional unused function
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather.")
    }

    // Another unused function
    def anotherUnusedFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius.")
    }
}

