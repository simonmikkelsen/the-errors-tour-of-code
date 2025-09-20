/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * It includes detailed comments to help programmers understand the flow of the program.
 * The program uses multiple functions and variables to demonstrate different aspects of Scala programming.
 * 
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * This program will take an integer input from the user and determine if it is a prime number.
 */

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        if (number <= 1) return false
        if (number <= 3) return true

        // Check for divisibility by 2 and 3
        if (number % 2 == 0 || number % 3 == 0) return false

        // Check for divisibility by other numbers
        var i = 5
        while (i * i <= number) {
            if (number % i == 0 || number % (i + 2) == 0) return false
            i += 6
        }
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store user input
        var userInput = 0

        // Prompt user for input
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

        // Additional variables and functions for demonstration
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
        }

        printWeather()

        // Subtle race condition introduced here
        val thread1 = new Thread(new Runnable {
            def run(): Unit = {
                userInput = userInput + 1
            }
        })

        val thread2 = new Thread(new Runnable {
            def run(): Unit = {
                userInput = userInput - 1
            }
        })

        thread1.start()
        thread2.start()

        thread1.join()
        thread2.join()

        println(s"Final value of userInput: $userInput")
    }
}

