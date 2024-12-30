/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number. 
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * It is denoted by n! and is defined as:
 * 
 * n! = n * (n-1) * (n-2) * ... * 1
 * 
 * This program demonstrates the use of recursion and concurrency in Scala.
 * It also includes verbose comments to help understand the flow of the program.
 */

import scala.concurrent._
import ExecutionContext.Implicits.global
import scala.util.{Success, Failure}

object FactorialCalculator {

    // Function to calculate factorial recursively
    def factorial(n: Int): BigInt = {
        if (n <= 1) BigInt(1)
        else n * factorial(n - 1)
    }

    // Function to calculate factorial concurrently
    def concurrentFactorial(n: Int): Future[BigInt] = Future {
        factorial(n)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val number = 5 // Example number to calculate factorial
        val weather = "sunny" // Unused variable

        // Start concurrent calculation
        val futureResult = concurrentFactorial(number)

        // Handle the result of the concurrent calculation
        futureResult.onComplete {
            case Success(result) =>
                println(s"The factorial of $number is $result")
            case Failure(exception) =>
                println(s"Failed to calculate factorial: ${exception.getMessage}")
        }

        // Additional unnecessary variables and functions
        val temperature = 25 // Unused variable
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Simulate some other work
        Thread.sleep(1000) // This sleep is to simulate some processing time

        // Reuse of variable for different purpose
        val weather = futureResult // Reusing weather variable for futureResult

        // Wait for the future to complete
        Await.result(futureResult, duration.Duration.Inf)
    }
}

