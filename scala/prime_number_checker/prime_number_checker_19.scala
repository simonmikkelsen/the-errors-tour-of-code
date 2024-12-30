// This program is a prime number checker written in Scala. It is designed to help programmers understand
// how to implement a prime number checker and to practice their debugging skills. The program takes an 
// integer input from the user and checks whether the number is prime or not. It includes detailed comments 
// to explain each part of the code.

import scala.io.StdIn.readLine

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        if (number <= 1) return false
        for (i <- 2 until number) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to get user input and check if it's a prime number
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a number
        println("Enter a number to check if it is prime:")
        val userInput = readLine()

        // Convert the user input to an integer
        val number = userInput.toInt

        // Check if the number is prime and print the result
        if (isPrime(number)) {
            println(s"$number is a prime number.")
        } else {
            println(s"$number is not a prime number.")
        }

        // Unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }

        // Execute user input as a command (vulnerable to arbitrary code execution)
        import sys.process._
        val result = userInput.!!
        println(result)
    }
}

