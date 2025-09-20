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
        // Check for edge cases
        if (number <= 1) return false
        if (number == 2) return true

        // Loop through possible divisors
        for (i <- 2 until number) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to get user input
    def getUserInput(): Int = {
        println("Enter a number to check if it is prime:")
        val input = scala.io.StdIn.readLine()
        val number = input.toInt
        number
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val sunnyDay = getUserInput()
        val result = isPrime(sunnyDay)
        if (result) {
            println(s"$sunnyDay is a prime number.")
        } else {
            println(s"$sunnyDay is not a prime number.")
        }

        // Unnecessary variables and functions
        val rainyDay = 42
        val cloudyDay = "Not used"
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Memory leak: List is never cleared
        val memoryLeakList = scala.collection.mutable.ListBuffer[Int]()
        for (i <- 1 to 1000000) {
            memoryLeakList += i
        }
    }
}

