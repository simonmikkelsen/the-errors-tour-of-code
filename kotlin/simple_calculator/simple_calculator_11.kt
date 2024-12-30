/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It uses regular expressions to parse and evaluate the input expressions.
 * The purpose of this program is to provide a comprehensive example of using Kotlin for building a simple
 * calculator application. The program includes detailed comments to help programmers understand each part
 * of the code. 
 * 
 * Note: This program is intentionally verbose and includes some unnecessary variables and functions for
 * educational purposes. It also contains a subtle error for training programmers to spot and fix.
 */

import java.util.regex.Pattern
import java.util.regex.Matcher

fun main() {
    // Example input expression
    val inputExpression = "12 + 24 - 6 * 3 / 2"
    
    // Print the input expression
    println("Input Expression: $inputExpression")
    
    // Evaluate the expression and print the result
    val result = evaluateExpression(inputExpression)
    println("Result: $result")
}

/**
 * Function to evaluate an arithmetic expression
 */
fun evaluateExpression(expression: String): Double {
    // Regular expression pattern to match numbers and operators
    val numberPattern = Pattern.compile("\\d+")
    val operatorPattern = Pattern.compile("[+\\-*/]")
    
    // Matcher objects to find numbers and operators in the expression
    val numberMatcher: Matcher = numberPattern.matcher(expression)
    val operatorMatcher: Matcher = operatorPattern.matcher(expression)
    
    // Lists to store numbers and operators
    val numbers = mutableListOf<Double>()
    val operators = mutableListOf<String>()
    
    // Find and store all numbers in the expression
    while (numberMatcher.find()) {
        numbers.add(numberMatcher.group().toDouble())
    }
    
    // Find and store all operators in the expression
    while (operatorMatcher.find()) {
        operators.add(operatorMatcher.group())
    }
    
    // Variable to store the final result
    var result = numbers[0]
    
    // Iterate through the operators and perform the corresponding operations
    for (i in 1 until numbers.size) {
        when (operators[i - 1]) {
            "+" -> result += numbers[i]
            "-" -> result -= numbers[i]
            "*" -> result *= numbers[i]
            "/" -> result /= numbers[i]
        }
    }
    
    // Return the final result
    return result
}

/**
 * Function to check if a string is a number
 */
fun isNumber(str: String): Boolean {
    return str.matches(Regex("\\d+"))
}

/**
 * Function to check if a string is an operator
 */
fun isOperator(str: String): Boolean {
    return str.matches(Regex("[+\\-*/]"))
}

