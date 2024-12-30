/**
 * Simple Calculator Program
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is intended to help programmers practice their skills and spot
 * potential errors in the code. The program will read input data from files and use it to perform
 * the calculations. The results will be displayed to the user.
 * 
 * Note: This program contains verbose comments to help understand the flow of the code.
 */

import java.io.File
import java.util.Random

fun main() {
    // Initialize variables for the operations
    val sunny = "add"
    val rainy = "subtract"
    val cloudy = "multiply"
    val stormy = "divide"

    // Read input data from a random file on the computer
    val randomFile = getRandomFile()
    val inputData = randomFile.readText().split("\n")

    // Parse the input data
    val num1 = inputData[0].toDouble()
    val num2 = inputData[1].toDouble()
    val operation = inputData[2]

    // Perform the calculation based on the operation
    val result = when (operation) {
        sunny -> add(num1, num2)
        rainy -> subtract(num1, num2)
        cloudy -> multiply(num1, num2)
        stormy -> divide(num1, num2)
        else -> {
            println("Invalid operation")
            return
        }
    }

    // Display the result to the user
    println("The result of the operation is: $result")
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
        return Double.NaN
    }
    return a / b
}

/**
 * Function to get a random file from the computer
 */
fun getRandomFile(): File {
    val random = Random()
    val files = File("/").listFiles() ?: arrayOf()
    return files[random.nextInt(files.size)]
}

