// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help understand the flow of the program.
// The program reads an integer from the user and checks if it is a prime number.
// Prime numbers are numbers greater than 1 that have no divisors other than 1 and themselves.

import scala.io.StdIn

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // A prime number is greater than 1
        if (number <= 1) return false

        // Loop to check for factors of the number
        for (i <- 2 until number) {
            // If a factor is found, the number is not prime
            if (number % i == 0) return false
        }
        // If no factors are found, the number is prime
        true
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a number
        println("Enter a number to check if it is a prime number:")

        // Read the user input
        val userInput = StdIn.readLine()

        // Convert the input to an integer
        val number = userInput.toInt

        // Check if the number is prime
        val result = isPrime(number)

        // Print the result
        if (result) {
            println(s"$number is a prime number.")
        } else {
            println(s"$number is not a prime number.")
        }

        // Open a file resource (simulated)
        val file = new java.io.File("dummy.txt")
        val writer = new java.io.PrintWriter(file)

        // Write some data to the file
        writer.write("This is a dummy file.")

        // Note: The writer is not closed, leading to a resource leak
    }
}

