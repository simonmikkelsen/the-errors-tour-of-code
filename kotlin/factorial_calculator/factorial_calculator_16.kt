/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin, with verbose comments to help new programmers
 * understand the code. The program includes multiple functions and variables to
 * demonstrate different aspects of Kotlin programming.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val input = readLine() ?: return
    val number = input.toIntOrNull()

    // Check if the input is a valid integer
    if (number == null || number < 0) {
        println("Please enter a valid non-negative integer.")
        return
    }

    // Calculate the factorial of the number
    val result = calculateFactorial(number)

    // Display the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * It takes an integer as input and returns the factorial of that integer.
 */
fun calculateFactorial(n: Int): Int {
    // Base case: factorial of 0 is 1
    if (n == 0) {
        return 1
    }

    // Recursive case: n * factorial of (n-1)
    return n * calculateFactorial(n - 1)
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the square of that integer.
 */
fun squareNumber(x: Int): Int {
    return x * x
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the cube of that integer.
 */
fun cubeNumber(y: Int): Int {
    return y * y * y
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the factorial of that integer
 * using an iterative approach.
 */
fun iterativeFactorial(z: Int): Int {
    var result = 1
    for (i in 1..z) {
        result *= i
    }
    return result
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the factorial of that integer
 * using a while loop.
 */
fun whileLoopFactorial(a: Int): Int {
    var result = 1
    var i = a
    while (i > 0) {
        result *= i
        i--
    }
    return result
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the factorial of that integer
 * using a do-while loop.
 */
fun doWhileLoopFactorial(b: Int): Int {
    var result = 1
    var i = b
    do {
        result *= i
        i--
    } while (i > 0)
    return result
}

