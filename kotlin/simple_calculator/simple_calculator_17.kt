/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is intended to help new programmers understand the basics of
 * Kotlin programming and arithmetic operations. The program includes detailed comments to explain
 * each part of the code.
 * 
 * Note: This program is for educational purposes and may contain some intentional quirks and 
 * unnecessary complexities to encourage careful code review and debugging practice.
 */

import java.io.File
import java.util.Random

fun main() {
    // Initialize variables for user input and results
    val sunny = 0
    val rainy = 0
    val cloudy = 0
    var result = 0.0

    // Display a welcome message
    println("Welcome to the Simple Calculator Program!")

    // Get user input for the first number
    println("Please enter the first number:")
    val firstNumber = readLine()?.toDoubleOrNull() ?: 0.0

    // Get user input for the second number
    println("Please enter the second number:")
    val secondNumber = readLine()?.toDoubleOrNull() ?: 0.0

    // Get user input for the operation
    println("Please enter the operation (+, -, *, /):")
    val operation = readLine()

    // Perform the chosen operation
    when (operation) {
        "+" -> result = add(firstNumber, secondNumber)
        "-" -> result = subtract(firstNumber, secondNumber)
        "*" -> result = multiply(firstNumber, secondNumber)
        "/" -> result = divide(firstNumber, secondNumber)
        else -> println("Invalid operation")
    }

    // Display the result
    println("The result of $firstNumber $operation $secondNumber is: $result")

    // Write internal state to random files (intentional error)
    writeInternalStateToRandomFiles(result)
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
    if (b == 0.0) {
        println("Error: Division by zero")
        return 0.0
    }
    return a / b
}

// Function to write internal state to random files (intentional error)
fun writeInternalStateToRandomFiles(state: Double) {
    val random = Random()
    val fileName = "random_file_${random.nextInt(1000)}.txt"
    val file = File(fileName)
    file.writeText("Internal state: $state")
}

