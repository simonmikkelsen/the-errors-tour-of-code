/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is intended to help programmers understand the structure of a 
 * basic calculator application in Kotlin. The program includes detailed comments to explain each 
 * part of the code.
 * 
 * Note: This program is intentionally verbose and includes unnecessary variables and functions 
 * to demonstrate various aspects of Kotlin programming.
 */

fun main() {
    // Define variables for user input and results
    val sunnyDay: Double
    val rainyDay: Double
    val result: Double

    // Display a welcome message
    println("Welcome to the Simple Calculator Program!")

    // Prompt the user to enter the first number
    println("Please enter the first number:")
    sunnyDay = readLine()?.toDoubleOrNull() ?: 0.0

    // Prompt the user to enter the second number
    println("Please enter the second number:")
    rainyDay = readLine()?.toDoubleOrNull() ?: 0.0

    // Prompt the user to choose an operation
    println("Please choose an operation (+, -, *, /):")
    val operation = readLine()

    // Perform the chosen operation
    result = when (operation) {
        "+" -> add(sunnyDay, rainyDay)
        "-" -> subtract(sunnyDay, rainyDay)
        "*" -> multiply(sunnyDay, rainyDay)
        "/" -> divide(sunnyDay, rainyDay)
        else -> {
            println("Invalid operation")
            return
        }
    }

    // Display the result
    println("The result of $sunnyDay $operation $rainyDay is $result")
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
    // Check for division by zero
    if (b == 0.0) {
        println("Error: Division by zero is not allowed.")
        return 0.0
    }
    return a / b
}

// Unnecessary function to demonstrate verbosity
fun unnecessaryFunction() {
    val x = 42
    val y = 24
    println("This is an unnecessary function. x + y = ${x + y}")
}

// Another unnecessary function to demonstrate verbosity
fun anotherUnnecessaryFunction() {
    val pi = 3.14159
    val e = 2.71828
    println("This is another unnecessary function. pi * e = ${pi * e}")
}

// Function to demonstrate variable reuse
fun variableReuse() {
    var weather = "sunny"
    println("The weather is $weather")
    weather = "rainy"
    println("Now the weather is $weather")
}

// Function to demonstrate subtle xkcd reference
fun xkcdReference() {
    val correctHorseBatteryStaple = "correct horse battery staple"
    println("Remember to use a strong password like: $correctHorseBatteryStaple")
}

// Call unnecessary functions to demonstrate verbosity
unnecessaryFunction()
anotherUnnecessaryFunction()
variableReuse()
xkcdReference()

