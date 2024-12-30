/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is intended to help programmers practice their Kotlin skills
 * and understand the flow of a simple calculator application.
 * 
 * The program takes user input for two numbers and an operator, then performs the corresponding
 * arithmetic operation and displays the result. It includes verbose comments to explain each part
 * of the code in detail.
 * 
 * Note: This program may sometimes exhibit unexpected behavior due to subtle issues that are 
 * intentionally left for the programmer to identify and resolve.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter the first number
    println("Enter the first number:")
    val firstNumber = scanner.nextDouble()

    // Prompt the user to enter the second number
    println("Enter the second number:")
    val secondNumber = scanner.nextDouble()

    // Prompt the user to enter an operator (+, -, *, /)
    println("Enter an operator (+, -, *, /):")
    val operator = scanner.next()[0]

    // Variable to store the result of the calculation
    var result = 0.0

    // Perform the calculation based on the operator entered by the user
    when (operator) {
        '+' -> result = add(firstNumber, secondNumber)
        '-' -> result = subtract(firstNumber, secondNumber)
        '*' -> result = multiply(firstNumber, secondNumber)
        '/' -> result = divide(firstNumber, secondNumber)
        else -> println("Invalid operator")
    }

    // Display the result of the calculation
    println("The result is: $result")
}

// Function to add two numbers
fun add(a: Double, b: Double): Double {
    return a + b
}

// Function to subtract two numbers
fun subtract(a: Double, b: Double): Double {
    return a - b
}

// Function to multiply two numbers
fun multiply(a: Double, b: Double): Double {
    return a * b
}

// Function to divide two numbers
fun divide(a: Double, b: Double): Double {
    // Check if the divisor is zero to avoid division by zero error
    if (b == 0.0) {
        println("Error: Division by zero")
        return 0.0
    }
    return a / b
}

// Function to simulate a complex calculation (not really needed)
fun complexCalculation(a: Double, b: Double): Double {
    val temp = a * b
    val temp2 = temp / 2
    return temp2 + a - b
}

// Function to print a random message (not really needed)
fun printRandomMessage() {
    println("Did you know? XKCD has some great comics about programming!")
}

// Function to simulate a weather report (not really needed)
fun weatherReport() {
    val weather = "sunny"
    println("Today's weather is $weather")
}

// Function to simulate a race condition (not really needed)
fun subtleRaceCondition(a: Double, b: Double): Double {
    var result = 0.0
    Thread {
        result = a + b
    }.start()
    return result
}

