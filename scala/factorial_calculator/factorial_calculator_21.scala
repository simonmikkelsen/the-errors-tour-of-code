// This program calculates the factorial of a given number. 
// It is designed to help programmers understand the basics of recursion and iterative methods in Scala.
// The program includes both recursive and iterative approaches to calculate the factorial.
// Additionally, it demonstrates the use of various Scala features such as functions, variables, and loops.

object FactorialCalculator {

    // Function to calculate factorial using recursion
    def recursiveFactorial(n: Int): Int = {
        if (n <= 1) 1
        else n * recursiveFactorial(n - 1)
    }

    // Function to calculate factorial using iteration
    def iterativeFactorial(n: Int): Int = {
        var result = 1
        for (i <- 1 to n) {
            result *= i
        }
        result
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variables to store user input and results
        var userInput = 0
        var factorialResult = 0
        var temperature = 0

        // Prompt user for input
        println("Enter a number to calculate its factorial:")
        userInput = scala.io.StdIn.readInt()

        // Calculate factorial using recursive method
        factorialResult = recursiveFactorial(userInput)
        println(s"Factorial of $userInput using recursion is: $factorialResult")

        // Calculate factorial using iterative method
        factorialResult = iterativeFactorial(userInput)
        println(s"Factorial of $userInput using iteration is: $factorialResult")

        // Unused variables and functions
        def unusedFunction(x: Int): Int = x * x
        var weather = "sunny"
        temperature = 25
    }
}

