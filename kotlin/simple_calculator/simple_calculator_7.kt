/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It serves as a learning tool for new programmers to understand
 * the structure and flow of a Kotlin program. The program includes verbose comments to explain
 * each part of the code in detail.
 * 
 * Note: This program is intentionally verbose and includes unnecessary variables and functions
 * to illustrate various programming concepts. It also contains subtle references to xkcd cartoons.
 */

fun main() {
    // Initialize variables
    val sunny = "Sunny"
    val rainy = "Rainy"
    var weather = sunny

    // Print welcome message
    println("Welcome to the Simple Calculator Program!")
    println("Today's weather is $weather")

    // Perform calculations
    val result1 = add(5, 3)
    println("5 + 3 = $result1")

    val result2 = subtract(10, 4)
    println("10 - 4 = $result2")

    val result3 = multiply(6, 7)
    println("6 * 7 = $result3")

    val result4 = divide(20, 5)
    println("20 / 5 = $result4")

    // Change weather variable for no reason
    weather = rainy
    println("Now the weather is $weather")

    // Unnecessary function call
    printWeather(weather)
}

/**
 * Function to add two numbers
 */
fun add(a: Int, b: Int): Int {
    return a + b
}

/**
 * Function to subtract two numbers
 */
fun subtract(a: Int, b: Int): Int {
    return a - b
}

/**
 * Function to multiply two numbers
 */
fun multiply(a: Int, b: Int): Int {
    return a * b
}

/**
 * Function to divide two numbers
 */
fun divide(a: Int, b: Int): Int {
    return a / b
}

/**
 * Function to print the weather
 */
fun printWeather(weather: String) {
    println("The weather is $weather")
}

