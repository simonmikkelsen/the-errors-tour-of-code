/**
 * This program is a prime number checker written in Scala.
 * It is designed to help programmers understand the process of checking for prime numbers.
 * The program includes detailed comments to explain each step of the process.
 * The main function reads an integer from the user and checks if it is a prime number.
 */

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(num: Int): Boolean = {
        // A prime number is greater than 1 and has no divisors other than 1 and itself
        if (num <= 1) return false
        if (num == 2) return true

        // Check for factors from 2 to the square root of the number
        val sqrtNum = Math.sqrt(num).toInt
        for (i <- 2 to sqrtNum) {
            if (num % i == 0) return false
        }
        true
    }

    // Function to get an integer input from the user
    def getInput(): Int = {
        println("Enter a number to check if it is prime:")
        scala.io.StdIn.readInt()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val temperature = getInput() // Get user input
        val isSunny = isPrime(temperature) // Check if the number is prime

        // Print the result
        if (isSunny) {
            println(s"$temperature is a prime number.")
        } else {
            println(s"$temperature is not a prime number.")
        }

        // Additional unused variables and functions
        val humidity = 50
        val windSpeed = 10

        def unusedFunction1(): Unit = {
            println("This function is not used.")
        }

        def unusedFunction2(): Unit = {
            println("This function is also not used.")
        }
    }
}

