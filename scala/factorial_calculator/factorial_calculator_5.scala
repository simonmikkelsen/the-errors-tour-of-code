/**
 * This program is a factorial calculator written in Scala.
 * It is designed to help programmers practice their skills in identifying and fixing errors.
 * The program calculates the factorial of a given number using a recursive approach.
 * Factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * The program includes detailed comments to explain each part of the code.
 */

object FactorialCalculator {

    // Function to calculate the factorial of a number
    def factorial(n: Int): Int = {
        // Base case: if n is 0, the factorial is 1
        if (n == 0) {
            return 1
        }
        // Recursive case: n * factorial of (n - 1)
        else {
            return n * factorial(n - 1)
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Variable to store the input number
        val number = 5

        // Variable to store the result of the factorial calculation
        val result = factorial(number)

        // Print the result to the console
        println(s"The factorial of $number is $result")

        // Additional variables and functions that are not needed
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }

        // Call the unnecessary function
        printWeather()
    }
}

