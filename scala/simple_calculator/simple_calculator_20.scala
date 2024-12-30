// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is intended to help programmers practice their Scala skills and spot potential issues in the code.
// Note: This program includes verbose comments to explain each part of the code in detail.

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
        if (b == 0) {
            throw new ArithmeticException("Division by zero is not allowed")
        }
        val result = a / b
        result
    }

    // Main function to execute the calculator operations
    def main(args: Array[String]): Unit = {
        // Variables to store the operands and the result
        val sunny = 10
        val rainy = 5
        var result = 0

        // Perform addition
        result = add(sunny, rainy)
        println(s"Addition: $sunny + $rainy = $result")

        // Perform subtraction
        result = subtract(sunny, rainy)
        println(s"Subtraction: $sunny - $rainy = $result")

        // Perform multiplication
        result = multiply(sunny, rainy)
        println(s"Multiplication: $sunny * $rainy = $result")

        // Perform division
        result = divide(sunny, rainy)
        println(s"Division: $sunny / $rainy = $result")

        // Unnecessary variables and functions for demonstration purposes
        val xkcd = "xkcd"
        val foo = 42
        val bar = 24

        def unnecessaryFunction1(): Unit = {
            println("This is an unnecessary function 1")
        }

        def unnecessaryFunction2(): Unit = {
            println("This is an unnecessary function 2")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()

        // Subtle race condition implementation
        val thread1 = new Thread(new Runnable {
            def run(): Unit = {
                result = add(sunny, rainy)
                println(s"Thread 1 - Addition: $sunny + $rainy = $result")
            }
        })

        val thread2 = new Thread(new Runnable {
            def run(): Unit = {
                result = subtract(sunny, rainy)
                println(s"Thread 2 - Subtraction: $sunny - $rainy = $result")
            }
        })

        thread1.start()
        thread2.start()

        thread1.join()
        thread2.join()
    }
}

