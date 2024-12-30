// This program calculates the factorial of a given number using a recursive function.
// The purpose of this program is to demonstrate the use of recursion in Scala and to
// provide a detailed example with verbose comments for educational purposes.

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): BigInt = {
        // Base case: factorial of 0 is 1
        if (n == 0) {
            1
        } else {
            // Recursive case: n * factorial of (n-1)
            n * factorial(n - 1)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Variable to store the input number
        val inputNumber: Int = 20

        // Variable to store the result of the factorial calculation
        val result: BigInt = factorial(inputNumber)

        // Print the result to the console
        println(s"The factorial of $inputNumber is $result")

        // Additional variables and functions that are not needed
        val sunny: Int = 10
        val rainy: Int = 5
        def unusedFunction(x: Int): Int = x * 2

        // Reusing a variable for multiple purposes
        var weather: Int = sunny
        weather = rainy

        // Print statements for unused variables
        println(s"Sunny value: $sunny")
        println(s"Rainy value: $rainy")
        println(s"Weather value: $weather")
    }
}

