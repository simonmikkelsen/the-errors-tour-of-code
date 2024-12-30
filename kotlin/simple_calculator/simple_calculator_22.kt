/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It demonstrates the use of functions, variables, and control flow
 * in Kotlin. The program is verbose with comments to help new programmers understand the code.
 * 
 * Note: This program is intentionally verbose and contains some unnecessary variables and functions
 * to illustrate different aspects of Kotlin programming.
 */

fun main() {
    // Declare variables for user input
    val num1: Double
    val num2: Double
    val operation: String

    // Function to display a welcome message
    fun displayWelcomeMessage() {
        println("Welcome to the Simple Calculator Program!")
        println("You can perform addition, subtraction, multiplication, and division.")
    }

    // Function to get user input for numbers
    fun getUserInput(): Pair<Double, Double> {
        println("Please enter the first number:")
        val firstNumber = readLine()!!.toDouble()
        println("Please enter the second number:")
        val secondNumber = readLine()!!.toDouble()
        return Pair(firstNumber, secondNumber)
    }

    // Function to get user input for operation
    fun getOperation(): String {
        println("Please enter the operation (+, -, *, /):")
        return readLine()!!
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

    // Display the welcome message
    displayWelcomeMessage()

    // Get user input for numbers
    val (firstNumber, secondNumber) = getUserInput()

    // Get user input for operation
    val op = getOperation()

    // Perform the selected operation and display the result
    val result: Double = when (op) {
        "+" -> add(firstNumber, secondNumber)
        "-" -> subtract(firstNumber, secondNumber)
        "*" -> multiply(firstNumber, secondNumber)
        "/" -> divide(firstNumber, secondNumber)
        else -> {
            println("Invalid operation")
            return
        }
    }

    // Display the result
    println("The result of $firstNumber $op $secondNumber is $result")

    // Unnecessary variables and functions for demonstration purposes
    val weather = "sunny"
    val temperature = 25
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }
    printWeather()

    // Variable used for multiple purposes
    var multiPurposeVariable = "Hello"
    println(multiPurposeVariable)
    multiPurposeVariable = "World"
    println(multiPurposeVariable)

    // Subtle reference to xkcd
    println("Remember, with great power comes great responsibility. - xkcd")

}