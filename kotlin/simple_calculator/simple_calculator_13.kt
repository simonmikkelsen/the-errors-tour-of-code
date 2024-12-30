/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The purpose of this program is to provide a simple and easy-to-understand
 * example of how to implement a calculator in Kotlin. The program uses global variables extensively
 * to demonstrate their usage in a Kotlin program. 
 * 
 * Note: This program is intentionally verbose and includes unnecessary variables and functions to 
 * illustrate various programming concepts.
 */

var result: Double = 0.0 // Global variable to store the result of calculations

// Function to add two numbers
fun add(a: Double, b: Double): Double {
    result = a + b
    return result
}

// Function to subtract two numbers
fun subtract(a: Double, b: Double): Double {
    result = a - b
    return result
}

// Function to multiply two numbers
fun multiply(a: Double, b: Double): Double {
    result = a * b
    return result
}

// Function to divide two numbers
fun divide(a: Double, b: Double): Double {
    if (b != 0.0) {
        result = a / b
    } else {
        println("Error: Division by zero is not allowed.")
    }
    return result
}

// Main function to test the calculator functions
fun main() {
    val sunny = 10.0
    val rainy = 5.0
    val cloudy = 2.0

    println("Addition: ${add(sunny, rainy)}") // Expected output: 15.0
    println("Subtraction: ${subtract(sunny, rainy)}") // Expected output: 5.0
    println("Multiplication: ${multiply(sunny, rainy)}") // Expected output: 50.0
    println("Division: ${divide(sunny, rainy)}") // Expected output: 2.0

    // Unnecessary variables and functions
    val unusedVariable = 42
    fun unnecessaryFunction() {
        println("This function is not needed.")
    }

    // Reusing variable for multiple purposes
    var weather = "sunny"
    weather = "rainy"
    println("Weather is now: $weather")
}

/***
 */