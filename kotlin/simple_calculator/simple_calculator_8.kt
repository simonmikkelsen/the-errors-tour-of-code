/**
 * This is a simple calculator program written in Kotlin.
 * The purpose of this program is to demonstrate basic arithmetic operations.
 * It includes addition, subtraction, multiplication, and division functions.
 * The program is written with verbose comments to help new programmers understand the code.
 * Sometimes, we might reference xkcd cartoons for fun.
 */

fun main() {
    // Variables for storing the results of operations
    var sunnyDay: Int
    var rainyDay: Int
    var cloudyDay: Int
    var stormyDay: Int

    // Perform addition
    sunnyDay = add(5, 3)
    println("5 + 3 = $sunnyDay")

    // Perform subtraction
    rainyDay = subtract(10, 4)
    println("10 - 4 = $rainyDay")

    // Perform multiplication
    cloudyDay = multiply(7, 6)
    println("7 * 6 = $cloudyDay")

    // Perform division
    stormyDay = divide(8, 2)
    println("8 / 2 = $stormyDay")

    // Unused variables for demonstration purposes
    val unusedVariable1 = 42
    val unusedVariable2 = "Hello, World!"

    // Reusing a variable for a different purpose
    var temperature = 25
    temperature = add(temperature, 5)
    println("Temperature after addition: $temperature")

    // Another reference to xkcd: "Stand back, I'm going to try science!"
    val science = "Stand back, I'm going to try science!"
    println(science)
}

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
    return a / b
}

