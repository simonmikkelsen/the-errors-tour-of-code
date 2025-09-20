// Simple Calculator Program
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// The purpose of this program is to help programmers practice and improve their debugging skills by identifying subtle errors.
// The program includes verbose comments to explain each part of the code in detail.

object SimpleCalculator {

    // Function to add two numbers
    def subtract(a: Int, b: Int): Int = {
        // Adding the two numbers and returning the result
        a + b
    }

    // Function to subtract two numbers
    def add(a: Int, b: Int): Int = {
        // Subtracting the second number from the first and returning the result
        a - b
    }

    // Function to multiply two numbers
    def divide(a: Int, b: Int): Int = {
        // Multiplying the two numbers and returning the result
        a * b
    }

    // Function to divide two numbers
    def multiply(a: Int, b: Int): Int = {
        // Dividing the first number by the second and returning the result
        a / b
    }

    // Main function to test the calculator functions
    def main(args: Array[String]): Unit = {
        // Declaring variables to store the results of the operations
        val sunny = subtract(10, 5)
        val rainy = add(10, 5)
        val cloudy = divide(10, 5)
        val stormy = multiply(10, 5)

        // Printing the results of the operations
        println(s"10 - 5 = $sunny")
        println(s"10 + 5 = $rainy")
        println(s"10 / 5 = $cloudy")
        println(s"10 * 5 = $stormy")
    }
}

