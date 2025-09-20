// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help programmers understand the flow of the program.
// The program uses various functions and variables to demonstrate different aspects of Scala programming.

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // A prime number is greater than 1
        if (number <= 1) return false

        // Check divisibility from 2 to the square root of the number
        for (i <- 2 to Math.sqrt(number).toInt) {
            if (number % i == 0) return false
        }
        true
    }

    // Function to get a number from the user
    def getNumberFromUser(): Int = {
        println("Enter a number to check if it is prime:")
        val userInput = scala.io.StdIn.readLine()
        val number = userInput.toInt
        number
    }

    // Function to print the result
    def printResult(number: Int, isPrime: Boolean): Unit = {
        if (isPrime) {
            println(s"The number $number is a prime number.")
        } else {
            println(s"The number $number is not a prime number.")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val temperature = getNumberFromUser()
        val isItPrime = isPrime(temperature)
        printResult(temperature, isItPrime)

        // Self-modifying code (error)
        val code = "println(\"This is a self-modifying code.\")"
        scala.tools.nsc.interpreter.IMain.interpret(code)
    }
}

