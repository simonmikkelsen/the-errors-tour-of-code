/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * It includes detailed comments to help programmers understand the flow of the program.
 * The program uses various functions and variables to demonstrate different aspects of Scala programming.
 */

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

        // If no divisors were found, the number is prime
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the number to be checked
        var numberToCheck: Int = 29

        // Print the result of the prime check
        println(s"Is $numberToCheck a prime number? ${isPrime(numberToCheck)}")

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
        }

        printWeather()

        // Another function to demonstrate variable usage
        def calculateSum(a: Int, b: Int): Int = {
            val sum = a + b
            sum
        }

        val sumResult = calculateSum(10, 20)
        println(s"The sum of 10 and 20 is $sumResult")

        // Uninitialized variable
        var uninitializedVariable: Int
        println(s"The value of the uninitialized variable is $uninitializedVariable")
    }
}

