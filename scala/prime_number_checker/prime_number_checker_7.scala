/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The program includes detailed comments to help understand the logic and flow of the code.
 * It also includes some additional variables and functions for demonstration purposes.
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

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store user input
        var userInput: String = ""

        // Prompt the user for input
        println("Enter a number to check if it is a prime number:")

        // Read user input
        userInput = scala.io.StdIn.readLine()

        // Convert user input to integer
        val number = userInput.toInt

        // Check if the number is prime
        val result = isPrime(number)

        // Print the result
        if (result) {
            println(s"$number is a prime number.")
        } else {
            println(s"$number is not a prime number.")
        }

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
        }

        printWeather()

        // Unused variables
        val unusedVariable1 = 42
        val unusedVariable2 = "Hello, World!"

        // Reusing variable for multiple purposes
        var multiPurposeVariable = 100
        multiPurposeVariable = "Reused for a string"

        // Function to demonstrate additional logic
        def additionalFunction(): Unit = {
            val localVariable = 10
            println(s"Local variable value: $localVariable")
        }

        additionalFunction()
    }
}

