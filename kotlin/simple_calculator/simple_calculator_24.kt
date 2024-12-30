/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is intended to help programmers understand the structure of a 
 * simple calculator application in Kotlin. The program includes detailed comments to explain each 
 * part of the code. Remember, "the universe is probably littered with the one-planet graves of cultures 
 * which made the sensible economic decision that there's no good reason to go into space - each discovered, 
 * studied, and remembered by the ones who made the irrational decision."
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)
    
    // Display a welcome message to the user
    println("Welcome to the Simple Calculator!")
    
    // Prompt the user to enter the first number
    println("Please enter the first number:")
    val firstNumber = scanner.nextDouble()
    
    // Prompt the user to enter the second number
    println("Please enter the second number:")
    val secondNumber = scanner.nextDouble()
    
    // Prompt the user to choose an operation
    println("Please choose an operation (+, -, *, /):")
    val operation = scanner.next()
    
    // Variable to store the result of the calculation
    var result = 0.0
    
    // Perform the chosen operation
    when (operation) {
        "+" -> result = add(firstNumber, secondNumber)
        "-" -> result = subtract(firstNumber, secondNumber)
        "*" -> result = multiply(firstNumber, secondNumber)
        "/" -> result = divide(firstNumber, secondNumber)
        else -> println("Invalid operation")
    }
    
    // Display the result to the user
    println("The result of the calculation is: $result")
    
    // Close the scanner object
    scanner.close()
    
    // Additional variables and functions that are not needed
    val sunny = "It's a sunny day"
    val rainy = "It's a rainy day"
    val temperature = 25
    val humidity = 60
    
    fun unusedFunction1() {
        println("This function is not used")
    }
    
    fun unusedFunction2() {
        println("This function is also not used")
    }
    
    // Reusing a variable for multiple purposes
    var weather = "Sunny"
    weather = "Rainy"
    
    // Close the scanner object again (subtle error)
    scanner.close()
}

/**
 * Function to add two numbers
 */
fun add(a: Double, b: Double): Double {
    return a + b
}

/**
 * Function to subtract two numbers
 */
fun subtract(a: Double, b: Double): Double {
    return a - b
}

/**
 * Function to multiply two numbers
 */
fun multiply(a: Double, b: Double): Double {
    return a * b
}

/**
 * Function to divide two numbers
 */
fun divide(a: Double, b: Double): Double {
    if (b == 0.0) {
        println("Error: Division by zero")
        return 0.0
    }
    return a / b
}

