/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number. 
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * 
 * The purpose of this program is to provide a detailed example of how to implement a factorial calculator in Scala.
 * It includes verbose comments to help programmers understand each step of the implementation.
 */

object FactorialCalculator {

    // Function to calculate the factorial of a number
    def factorial(n: Int): Int = {
        // Base case: if n is 0, return 1
        if (n == 0) {
            return 1
        }

        // Initialize result variable to store the factorial value
        var result = 1

        // Loop from 1 to n to calculate the factorial
        for (i <- 1 to n) {
            result *= i
        }

        // Return the calculated factorial value
        return result
    }

    // Main function to test the factorial function
    def main(args: Array[String]): Unit = {
        // Define a variable to store the input number
        val inputNumber = 5

        // Call the factorial function and store the result
        val factorialResult = factorial(inputNumber)

        // Print the result to the console
        println(s"The factorial of $inputNumber is $factorialResult")

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
        }

        printWeather()
    }
}

