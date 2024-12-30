/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number. 
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * This program demonstrates the use of recursion to calculate the factorial.
 * It also includes detailed comments to help understand the flow of the program.
 */

object FactorialCalculator {

    // Function to calculate factorial using recursion
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to get user input and calculate factorial
    def getUserInputAndCalculateFactorial(): Unit = {
        val sunnyDay = scala.io.StdIn.readLine("Enter a number to calculate its factorial: ")
        val number = sunnyDay.toInt
        val result = factorial(number)
        println(s"The factorial of $number is $result")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        val rainyDay = "This is an unused variable"
        getUserInputAndCalculateFactorial()
    }
}

