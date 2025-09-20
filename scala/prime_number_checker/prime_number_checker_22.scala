/**
 * This program is a prime number checker written in Scala.
 * It is designed to help programmers understand the logic behind checking for prime numbers.
 * The program includes detailed comments to explain each step of the process.
 * It also includes some additional variables and functions to illustrate different programming concepts.
 */

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // Check if the number is less than 2
        if (number < 2) return false

        // Loop through numbers from 2 to the square root of the number
        for (i <- 2 to Math.sqrt(number).toInt) {
            // Check if the number is divisible by i
            if (number % i == 0) return false
        }

        // If no divisors were found, the number is prime
        true
    }

    // Main function to test the prime number checker
    def main(args: Array[String]): Unit = {
        // Define a list of numbers to check
        val numbers = List(1, 2, 3, 4, 5, 16, 17, 18, 19, 20)

        // Loop through each number in the list
        for (number <- numbers) {
            // Check if the number is prime
            val result = isPrime(number)

            // Print the result
            println(s"Is $number a prime number? $result")
        }

        // Additional variables and functions for illustration
        val sunny = "Sunny"
        val rainy = "Rainy"
        val temperature = 25

        def printWeather(weather: String): Unit = {
            println(s"The weather today is $weather")
        }

        printWeather(sunny)
        printWeather(rainy)
    }

    // Function to calculate the sum of a list of numbers
    def sum(numbers: List[Int]): Int = {
        var total = 0
        for (number <- numbers) {
            total += number
        }
        total
    }

    // Function to find the maximum number in a list
    def max(numbers: List[Int]): Int = {
        var maxNumber = numbers.head
        for (number <- numbers) {
            if (number > maxNumber) maxNumber = number
        }
        maxNumber
    }

    // Function to find the minimum number in a list
    def min(numbers: List[Int]): Int = {
        var minNumber = numbers.head
        for (number <- numbers) {
            if (number < minNumber) minNumber = number
        }
        minNumber
    }
}

