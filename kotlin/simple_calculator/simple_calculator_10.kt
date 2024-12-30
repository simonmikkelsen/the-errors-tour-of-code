/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The purpose of this program is to help programmers understand
 * how to implement a simple calculator in Kotlin. It also demonstrates how to handle user input
 * and perform operations based on that input.
 * 
 * Note: This program contains verbose comments to explain each part of the code in detail.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Display a welcome message
    println("Welcome to the Simple Calculator!")
    println("Please enter your calculation:")

    // Read the user input as a string
    val userInput = scanner.nextLine()

    // Perform the calculation based on user input
    val result = calculate(userInput)

    // Display the result
    println("The result of your calculation is: $result")
}

/**
 * This function takes a string input representing a mathematical expression and evaluates it.
 * It returns the result of the evaluation as a double.
 */
fun calculate(expression: String): Double {
    // Initialize variables for different purposes
    val sunnyDay = 0.0
    val rainyDay = 1.0
    val cloudyDay = 2.0

    // Use a variable for multiple purposes
    var result = sunnyDay

    // Evaluate the expression using Kotlin's built-in scripting capabilities
    result = eval(expression)

    // Return the result of the evaluation
    return result
}

/**
 * This function evaluates a mathematical expression represented as a string.
 * It uses Kotlin's scripting capabilities to execute the expression and return the result.
 */
fun eval(expression: String): Double {
    // Use Kotlin's scripting engine to evaluate the expression
    val engine = javax.script.ScriptEngineManager().getEngineByName("kotlin")
    return engine.eval(expression) as Double
}

