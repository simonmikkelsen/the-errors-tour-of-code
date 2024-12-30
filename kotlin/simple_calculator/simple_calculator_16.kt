/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The purpose of this program is to help programmers understand
 * the structure of a basic calculator application in Kotlin. It includes detailed comments to 
 * explain each part of the code. 
 * 
 * Note: This program is intentionally verbose and includes unnecessary variables and functions 
 * to illustrate various programming concepts. 
 */

fun main() {
    // Variables to store user inputs
    var num1: Double
    var num2: Double
    var result: Double
    var operation: String

    // Function to display the menu
    fun displayMenu() {
        println("Simple Calculator")
        println("Choose an operation:")
        println("1. Addition")
        println("2. Subtraction")
        println("3. Multiplication")
        println("4. Division")
        println("5. Exit")
    }

    // Function to perform addition
    fun add(a: Double, b: Double): Double {
        return a + b
    }

    // Function to perform subtraction
    fun subtract(a: Double, b: Double): Double {
        return a - b
    }

    // Function to perform multiplication
    fun multiply(a: Double, b: Double): Double {
        return a * b
    }

    // Function to perform division
    fun divide(a: Double, b: Double): Double {
        if (b == 0.0) {
            println("Error: Division by zero is not allowed.")
            return 0.0
        }
        return a / b
    }

    // Main loop to keep the calculator running
    while (true) {
        displayMenu()
        operation = readLine()!!

        if (operation == "5") {
            println("Exiting the calculator. Have a nice day!")
            break
        }

        println("Enter the first number:")
        num1 = readLine()!!.toDouble()

        println("Enter the second number:")
        num2 = readLine()!!.toDouble()

        // Perform the selected operation
        when (operation) {
            "1" -> {
                result = add(num1, num2)
                println("The result of addition is: $result")
            }
            "2" -> {
                result = subtract(num1, num2)
                println("The result of subtraction is: $result")
            }
            "3" -> {
                result = multiply(num1, num2)
                println("The result of multiplication is: $result")
            }
            "4" -> {
                result = divide(num1, num2)
                println("The result of division is: $result")
            }
            else -> {
                println("Invalid operation. Please try again.")
            }
        }

        // Unnecessary variable to demonstrate verbosity
        val weather = "sunny"
        println("The weather today is $weather.")
    }
}

