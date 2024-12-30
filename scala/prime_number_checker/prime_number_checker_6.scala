/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The purpose of this program is to help programmers understand the logic behind prime number checking
 * and to practice writing and debugging Scala code.
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
        // Prompt the user for input
        println("Enter a number to check if it is prime:")

        // Read the user input
        val input = scala.io.StdIn.readLine()

        // Convert the input to an integer
        val number = input.toInt

        // Check if the number is prime
        val result = isPrime(number)

        // Print the result
        if (result) {
            println(s"$number is a prime number.")
        } else {
            println(s"$number is not a prime number.")
        }
    }

    // Additional unused functions and variables
    def unusedFunction1(): Unit = {
        val weather = "sunny"
        println("This function is not used.")
    }

    def unusedFunction2(): Unit = {
        val temperature = 25
        println("This function is also not used.")
    }

    val unusedVariable1 = 42
    val unusedVariable2 = "Hello, World!"
}

