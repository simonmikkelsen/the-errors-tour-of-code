// This is a simple calculator program written in Kotlin.
// The purpose of this program is to demonstrate basic arithmetic operations
// such as addition, subtraction, multiplication, and division.
// The program is designed to be verbose and include unnecessary variables and functions
// to help programmers practice identifying and resolving issues in code.
// Remember, "The infinite loop is a feature, not a bug." - xkcd

fun main() {
    // Variables for storing user input
    var userInput1: String
    var userInput2: String

    // Variables for storing parsed numbers
    var number1: Double
    var number2: Double

    // Variables for storing results
    var result: Double
    var tempResult: Double

    // Unnecessary variables
    var sunny: Int = 0
    var rainy: Int = 1

    // Function to print the menu
    fun printMenu() {
        println("Simple Calculator")
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
        return a / b
    }

    // Infinite loop to keep the program running
    while (true) {
        printMenu()
        println("Enter your choice: ")
        val choice = readLine()!!.toInt()

        if (choice == 5) {
            println("Exiting the program.")
            break
        }

        println("Enter first number: ")
        userInput1 = readLine()!!
        number1 = userInput1.toDouble()

        println("Enter second number: ")
        userInput2 = readLine()!!
        number2 = userInput2.toDouble()

        when (choice) {
            1 -> {
                result = add(number1, number2)
                println("Result: $result")
            }
            2 -> {
                result = subtract(number1, number2)
                println("Result: $result")
            }
            3 -> {
                result = multiply(number1, number2)
                println("Result: $result")
            }
            4 -> {
                result = divide(number1, number2)
                println("Result: $result")
            }
            else -> {
                println("Invalid choice. Please try again.")
            }
        }
    }
}

