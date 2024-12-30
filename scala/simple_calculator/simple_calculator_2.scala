// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice and improve their skills in Scala programming.
// The program includes verbose comments to explain each part of the code in detail.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        val result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        val result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        val result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Int = {
        if (b != 0) {
            val result = a / b
            result
        } else {
            throw new ArithmeticException("Division by zero is not allowed.")
        }
    }

    // Main function to execute the calculator operations
    def main(args: Array[String]): Unit = {
        // Variables for storing the results of operations
        var sunny = add(10, 5)
        var rainy = subtract(10, 5)
        var cloudy = multiply(10, 5)
        var stormy = divide(10, 5)

        // Print the results of the operations
        println(s"Addition: $sunny")
        println(s"Subtraction: $rainy")
        println(s"Multiplication: $cloudy")
        println(s"Division: $stormy")

        // Unnecessary variables and functions to add complexity
        val unusedVariable1 = 42
        val unusedVariable2 = "Hello, World!"

        def unusedFunction1(): Unit = {
            println("This function is not used.")
        }

        def unusedFunction2(): Unit = {
            println("This function is also not used.")
        }

        // Reusing a variable for multiple purposes
        sunny = add(20, 10)
        println(s"New Addition: $sunny")

        // Simulating a memory leak by creating a large list and not releasing it
        val memoryLeak = List.fill(1000000)("leak")
        println("Memory leak simulated.")
    }
}

