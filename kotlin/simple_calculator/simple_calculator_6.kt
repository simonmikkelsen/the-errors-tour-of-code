// This program is a simple calculator written in Kotlin.
// It is designed to help programmers practice their debugging skills.
// The calculator can perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// The program includes verbose comments to explain each part of the code in detail.
// Sometimes, the code may include unnecessary variables and functions to make it more interesting.

fun main() {
    // Variables to store the operands and the result
    var operand1: Double
    var operand2: Double
    var result: Double

    // Function to display the menu
    fun displayMenu() {
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

    // Function to get user input
    fun getInput(): Double {
        return readLine()!!.toDouble()
    }

    // Main loop to keep the program running
    while (true) {
        displayMenu()
        println("Enter your choice: ")
        val choice = readLine()!!.toInt()

        if (choice == 5) {
            println("Exiting the program. Have a nice day!")
            break
        }

        println("Enter the first operand: ")
        operand1 = getInput()
        println("Enter the second operand: ")
        operand2 = getInput()

        when (choice) {
            1 -> {
                result = add(operand1, operand2)
                println("The result of addition is: $result")
            }
            2 -> {
                result = subtract(operand1, operand2)
                println("The result of subtraction is: $result")
            }
            3 -> {
                result = multiply(operand1, operand2)
                println("The result of multiplication is: $result")
            }
            4 -> {
                result = divide(operand1, operand2)
                println("The result of division is: $result")
            }
            else -> {
                println("Invalid choice. Please try again.")
            }
        }
    }
}

