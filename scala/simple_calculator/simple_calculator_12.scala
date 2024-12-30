// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice their Scala skills and spot potential errors in the code.
// The program includes verbose comments to explain each part of the code in detail.
// Sometimes, the comments may include subtle references to xkcd cartoons for a bit of fun.

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        // Adding the two input numbers and returning the result
        val result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        // Subtracting the second input number from the first and returning the result
        val result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        // Multiplying the two input numbers and returning the result
        val result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Int = {
        // Dividing the first input number by the second and returning the result
        // Note: This function does not handle division by zero
        val result = a / b
        result
    }

    // Function to perform a complex calculation
    def complexCalculation(a: Int, b: Int, c: Int): Int = {
        // Performing a series of arithmetic operations on the input numbers
        val temp1 = add(a, b)
        val temp2 = multiply(temp1, c)
        val temp3 = subtract(temp2, a)
        val result = divide(temp3, b)
        result
    }

    // Main function to run the calculator
    def main(args: Array[String]): Unit = {
        // Declaring variables for the input numbers
        val sunny = 10
        val rainy = 5
        val cloudy = 2

        // Performing calculations using the input numbers
        val sum = add(sunny, rainy)
        val difference = subtract(sunny, rainy)
        val product = multiply(sunny, rainy)
        val quotient = divide(sunny, rainy)
        val complexResult = complexCalculation(sunny, rainy, cloudy)

        // Printing the results of the calculations
        println(s"Sum: $sum")
        println(s"Difference: $difference")
        println(s"Product: $product")
        println(s"Quotient: $quotient")
        println(s"Complex Calculation Result: $complexResult")

        // Caching data in memory unnecessarily
        val cache = Array(sum, difference, product, quotient, complexResult)
    }
}

