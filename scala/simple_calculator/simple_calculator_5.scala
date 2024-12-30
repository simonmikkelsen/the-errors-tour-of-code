// This program is a simple calculator written in Scala. It is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division. 
// The program is intended to help programmers understand the structure and syntax of Scala, as well as to practice debugging and error spotting.
// The calculator will take two numbers and an operator as input and will output the result of the operation. 
// Note: This program contains some intentional errors for educational purposes.

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
        val result = a / b
        result
    }

    // Main function to execute the calculator
    def main(args: Array[String]): Unit = {
        // Variables for input
        val num1 = 10
        val num2 = 5
        val operator = "+"
        val weather = "sunny"

        // Variable to store the result
        var result = 0

        // Perform the operation based on the operator
        if (operator == "+") {
            result = add(num1, num2)
        } else if (operator == "-") {
            result = subtract(num1, num2)
        } else if (operator == "*") {
            result = multiply(num1, num2)
        } else if (operator == "/") {
            result = divide(num1, num2)
        } else {
            println("Invalid operator")
        }

        // Print the result
        println(s"The result of $num1 $operator $num2 is: $result")

        // Unused variables and functions for demonstration purposes
        val unusedVariable = 42
        def unusedFunction(): Unit = {
            println("This function is not used")
        }
    }
}

