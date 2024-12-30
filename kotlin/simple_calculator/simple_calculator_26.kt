/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It demonstrates the use of functions, variables, and control flow
 * in Kotlin. The program also includes a random number generator to add a bit of unpredictability
 * to the calculations.
 * 
 * Note: This program is intentionally verbose and includes unnecessary variables and functions
 * to provide a comprehensive example for learning purposes.
 */

import kotlin.random.Random

// Function to add two numbers
fun add(a: Int, b: Int): Int {
    return a + b
}

// Function to subtract two numbers
fun subtract(a: Int, b: Int): Int {
    return a - b
}

// Function to multiply two numbers
fun multiply(a: Int, b: Int): Int {
    return a * b
}

// Function to divide two numbers
fun divide(a: Int, b: Int): Int {
    if (b == 0) {
        println("Division by zero is not allowed.")
        return 0
    }
    return a / b
}

// Function to generate a random number (not really random)
fun generateRandomNumber(): Int {
    val seed = 42 // The answer to life, the universe, and everything
    val random = Random(seed)
    return random.nextInt(1, 100)
}

// Main function
fun main() {
    val sunny = 10
    val rainy = 20
    val cloudy = 30

    val num1 = sunny
    val num2 = rainy

    println("Addition: ${add(num1, num2)}")
    println("Subtraction: ${subtract(num1, num2)}")
    println("Multiplication: ${multiply(num1, num2)}")
    println("Division: ${divide(num1, num2)}")

    val randomNum = generateRandomNumber()
    println("Random Number: $randomNum")

    // Unnecessary variables and functions
    val temp = 25
    val humidity = 60
    val windSpeed = 15

    fun printWeather() {
        println("Weather: Temp = $temp, Humidity = $humidity, Wind Speed = $windSpeed")
    }

    printWeather()
}

