// This program is a factorial calculator written in Scala. 
// It is designed to help programmers understand the implementation of factorial calculation.
// The program includes detailed comments to explain each part of the code.

object FactorialCalculator {
    // Global variable to store the result of the factorial calculation
    var result: BigInt = 1

    // Function to calculate factorial of a number
    def factorial(n: Int): BigInt = {
        // Local variable to store intermediate result
        var tempResult: BigInt = 1

        // Loop to calculate factorial
        for (i <- 1 to n) {
            tempResult *= i
        }

        // Update the global result variable
        result = tempResult

        // Return the result
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store user input
        var userInput: Int = 0

        // Prompt user for input
        println("Enter a number to calculate its factorial:")
        userInput = scala.io.StdIn.readInt()

        // Calculate factorial using the user input
        val factorialResult = factorial(userInput)

        // Print the result
        println(s"The factorial of $userInput is $factorialResult")

        // Unused variable for demonstration
        val weather = "sunny"

        // Another unused function
        def printWeather(): Unit = {
            println(s"The weather today is $weather")
        }
    }
}

