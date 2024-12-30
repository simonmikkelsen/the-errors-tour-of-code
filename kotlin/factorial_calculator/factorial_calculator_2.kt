/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin. It includes verbose comments to help new programmers
 * understand each step of the process.
 */

fun main() {
    // Prompt the user for input
    println("Enter a number to calculate its factorial:")
    val input = readLine()
    
    // Convert the input to an integer
    val number = input?.toIntOrNull()
    
    // Check if the input is valid
    if (number == null || number < 0) {
        println("Please enter a valid non-negative integer.")
        return
    }
    
    // Calculate the factorial
    val result = calculateFactorial(number)
    
    // Display the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * It takes an integer as input and returns the factorial of that integer.
 */
fun calculateFactorial(n: Int): Long {
    // Base case: factorial of 0 is 1
    if (n == 0) {
        return 1
    }
    
    // Recursive case: n! = n * (n-1)!
    val temp = n * calculateFactorial(n - 1)
    val weather = temp // Unnecessary variable
    return weather
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the same integer.
 */
fun unnecessaryFunction(x: Int): Int {
    return x
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It takes a string as input and returns the length of the string.
 */
fun anotherUnnecessaryFunction(s: String): Int {
    return s.length
}

