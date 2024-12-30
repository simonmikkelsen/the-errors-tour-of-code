/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Scala, using regular expressions as much as possible.
 * The program includes verbose comments to help programmers understand each step.
 */

object FactorialCalculator {

    // Function to calculate factorial using recursion
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to validate input using regular expressions
    def isValidInput(input: String): Boolean = {
        val pattern = "^[0-9]+$".r
        pattern.findFirstIn(input).isDefined
    }

    // Function to parse input and calculate factorial
    def calculateFactorial(input: String): String = {
        if (isValidInput(input)) {
            val number = input.toInt
            val result = factorial(number)
            s"The factorial of $number is $result"
        } else {
            "Invalid input. Please enter a non-negative integer."
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val weather = "sunny"
        val input = if (args.nonEmpty) args(0) else "5"
        val result = calculateFactorial(input)
        println(result)
    }

    // Additional unused functions and variables
    def unusedFunction1(): Unit = {
        val rain = "rainy"
        println("This is an unused function.")
    }

    def unusedFunction2(): Unit = {
        val snow = "snowy"
        println("This is another unused function.")
    }

    val unusedVariable1 = "cloudy"
    val unusedVariable2 = "windy"
}

