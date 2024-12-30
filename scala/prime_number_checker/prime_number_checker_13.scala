// This program is designed to check if a number is a prime number.
// It takes an integer input from the user and determines if it is prime.
// The program uses various functions and variables to achieve this goal.

object PrimeNumberChecker {
    // Global variable to store the number to be checked
    var numberToCheck: Int = 0

    // Function to check if a number is prime
    def isPrime(num: Int): Boolean = {
        if (num <= 1) return false
        for (i <- 2 until num) {
            if (num % i == 0) return false
        }
        true
    }

    // Function to get user input
    def getUserInput(): Unit = {
        println("Enter a number to check if it is prime:")
        numberToCheck = scala.io.StdIn.readInt()
    }

    // Function to print the result
    def printResult(isPrime: Boolean): Unit = {
        if (isPrime) {
            println(s"$numberToCheck is a prime number.")
        } else {
            println(s"$numberToCheck is not a prime number.")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        getUserInput()
        val result = isPrime(numberToCheck)
        printResult(result)
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val temp = 0
        println("This function is not used.")
    }

    // Another unused function
    def anotherUnusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather.")
    }
}

