/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of recursion in Kotlin.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 is 5*4*3*2*1 which is 120.
 * This program will prompt the user to enter a number and then calculate its factorial.
 * The result will be displayed to the user.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val input = readLine()
    
    // Convert the input to an integer
    val number = input?.toIntOrNull()
    
    // Check if the input is a valid integer
    if (number != null && number >= 0) {
        // Calculate the factorial of the number
        val result = calculateFactorial(number)
        
        // Display the result to the user
        println("The factorial of $number is $result")
    } else {
        // Display an error message if the input is not valid
        println("Please enter a valid non-negative integer.")
    }
}

/**
 * This function calculates the factorial of a given number using recursion.
 * @param n The number to calculate the factorial of.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Long {
    // Base case: factorial of 0 is 1
    if (n == 0) {
        return 1
    }
    
    // Recursive case: factorial of n is n * factorial of (n-1)
    val result = n * calculateFactorial(n - 1)
    
    // Return the result
    return result
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the factorial of a given number using a loop.
 * @param n The number to calculate the factorial of.
 * @return The factorial of the given number.
 */
fun calculateFactorialLoop(n: Int): Long {
    var result = 1L
    for (i in 1..n) {
        result *= i
    }
    return result
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the factorial of a given number using a while loop.
 * @param n The number to calculate the factorial of.
 * @return The factorial of the given number.
 */
fun calculateFactorialWhile(n: Int): Long {
    var result = 1L
    var i = 1
    while (i <= n) {
        result *= i
        i++
    }
    return result
}

