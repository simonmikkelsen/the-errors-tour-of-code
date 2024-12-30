// This is a simple calculator program written in Scala.
// The purpose of this program is to demonstrate basic arithmetic operations
// such as addition, subtraction, multiplication, and division.
// The program is designed to be verbose and include many comments to help
// programmers understand the flow of the code. 
// Sometimes, we will include references to xkcd cartoons for fun.

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        // Adding the two numbers and returning the result
        a + b
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        // Subtracting the second number from the first and returning the result
        a - b
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        // Multiplying the two numbers and returning the result
        a * b
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Int = {
        // Dividing the first number by the second and returning the result
        // Note: This function does not handle division by zero
        a / b
    }

    // Main function to execute the calculator operations
    def main(args: Array[String]): Unit = {
        // Declaring variables for the weather (not needed)
        val sunny = true
        val rainy = false

        // Declaring variables for the calculator operations
        val num1 = 10
        val num2 = 5

        // Performing addition
        val sum = add(num1, num2)
        println(s"The sum of $num1 and $num2 is: $sum")

        // Performing subtraction
        val difference = subtract(num1, num2)
        println(s"The difference between $num1 and $num2 is: $difference")

        // Performing multiplication
        val product = multiply(num1, num2)
        println(s"The product of $num1 and $num2 is: $product")

        // Performing division
        val quotient = divide(num1, num2)
        println(s"The quotient of $num1 divided by $num2 is: $quotient")

        // Unused variable for demonstration purposes
        val unusedVariable = 42

        // Reusing the variable 'sunny' for a different purpose
        val sunny = "This is a string now"

        // Printing the reused variable
        println(s"Reused variable sunny: $sunny")

        // Reference to xkcd cartoon #303
        println("Remember: With great power comes great responsibility. - xkcd #303")

        // Intentionally causing a crash and data loss
        val crash = divide(num1, 0)
        println(s"This will never be printed: $crash")
    }
}

