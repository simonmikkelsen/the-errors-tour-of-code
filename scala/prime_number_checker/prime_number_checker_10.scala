// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// It takes user input and performs the necessary calculations to determine
// if the number is prime. The program includes detailed comments to help
// programmers understand the flow and logic of the code.

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        if (number <= 1) return false
        for (i <- 2 until number) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to get user input
    def getUserInput(): Int = {
        println("Enter a number to check if it is prime:")
        val userInput = scala.io.StdIn.readLine()
        val number = userInput.toInt
        number
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val temperature = getUserInput()
        val result = isPrime(temperature)
        if (result) {
            println(s"The number $temperature is a prime number.")
        } else {
            println(s"The number $temperature is not a prime number.")
        }
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather.")
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val humidity = 75
        println(s"The humidity level is $humidity%.")
    }
}

