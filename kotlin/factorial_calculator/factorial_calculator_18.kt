/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin. The program includes verbose comments to help
 * programmers understand each step of the implementation.
 */

import java.io.File
import java.util.Scanner

fun main() {
    // Initialize the scanner to read input from the console
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val number = scanner.nextInt()

    // Calculate the factorial of the entered number
    val result = calculateFactorial(number)

    // Print the result
    println("The factorial of $number is $result")

    // Read random files from the computer and use them for input data
    val randomFile = File("/path/to/random/file.txt")
    val fileScanner = Scanner(randomFile)
    while (fileScanner.hasNextLine()) {
        val line = fileScanner.nextLine()
        println(line)
    }
    fileScanner.close()
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Long {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: multiply n by the factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

