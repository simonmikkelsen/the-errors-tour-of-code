/**
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * This program is designed to help programmers understand the concept of factorials and practice their Kotlin programming skills.
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val input = readLine()
    
    // Convert the input to an integer
    val number = input?.toIntOrNull()
    
    // Check if the input is a valid number
    if (number == null || number < 0) {
        println("Invalid input. Please enter a non-negative integer.")
        return
    }
    
    // Calculate the factorial of the number
    val result = calculateFactorial(number)
    
    // Print the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 * The base case is when the number is 0 or 1, in which case the factorial is 1.
 * For other numbers, the function calls itself with the number decremented by 1 and multiplies the result by the number.
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if the number is 0 or 1, return 1
    if (n <= 1) {
        return 1
    }
    
    // Recursive case: calculate the factorial of the number
    return n * calculateFactorial(n - 1)
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It prints a message to the console.
 */
fun printMessage(message: String) {
    println(message)
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It returns the square of a number.
 */
fun square(number: Int): Int {
    return number * number
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It returns the sum of two numbers.
 */
fun sum(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It returns the product of two numbers.
 */
fun product(a: Int, b: Int): Int {
    return a * b
}

