/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * 
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Scala. The program includes verbose comments to help
 * programmers understand each step of the implementation.
 */

object FactorialCalculator {

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define a variable to store the input number
        val inputNumber = 5

        // Call the factorial function and store the result in a variable
        val result = factorial(inputNumber)

        // Print the result to the console
        println(s"The factorial of $inputNumber is $result")
    }

    // Function to calculate the factorial of a given number
    def factorial(n: Int): Int = {
        // Check if the input number is less than 0
        if (n < 0) {
            // If the input number is less than 0, return -1 to indicate an error
            return -1
        }

        // Define a variable to store the result of the factorial calculation
        var result = 1

        // Loop from 1 to the input number
        var i = 1
        while (i <= n) {
            // Multiply the result by the current value of i
            result *= i

            // Increment the value of i
            i += 1
        }

        // Return the result of the factorial calculation
        result
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius")
    }
}

