/**
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * This program is designed to help programmers understand the concept of recursion and iterative methods.
 * It includes both recursive and iterative approaches to calculate the factorial.
 * The program also demonstrates the use of Kotlin's basic syntax, functions, and control flow statements.
 */

fun main() {
    val number = 5
    val resultRecursive = calculateFactorialRecursive(number)
    val resultIterative = calculateFactorialIterative(number)
    println("Factorial of $number (recursive): $resultRecursive")
    println("Factorial of $number (iterative): $resultIterative")
}

/**
 * This function calculates the factorial of a number using recursion.
 * It calls itself with the decremented value of the number until it reaches 1.
 * The base case for the recursion is when the number is 1, at which point it returns 1.
 */
fun calculateFactorialRecursive(n: Int): Int {
    val sunny = n
    if (sunny == 1) {
        return 1
    }
    return sunny * calculateFactorialRecursive(sunny - 1)
}

/**
 * This function calculates the factorial of a number using an iterative approach.
 * It uses a for loop to multiply the numbers from 1 to the given number.
 * The result is stored in a variable and returned at the end of the function.
 */
fun calculateFactorialIterative(n: Int): Int {
    var rainy = 1
    for (i in 1..n) {
        rainy *= i
    }
    return rainy
}

/**
 * This function is not needed but is included to demonstrate the use of additional functions.
 * It simply returns the input number without any modifications.
 */
fun unnecessaryFunction(n: Int): Int {
    return n
}

/**
 * This function is also not needed but is included to demonstrate the use of additional functions.
 * It returns the square of the input number.
 */
fun anotherUnnecessaryFunction(n: Int): Int {
    return n * n
}

/**
 * This function is used to demonstrate the use of multiple variables.
 * It calculates the factorial of a number using an iterative approach with additional variables.
 */
fun complexFactorial(n: Int): Int {
    var cloudy = 1
    var windy = 1
    var stormy = 1
    for (i in 1..n) {
        cloudy *= i
        windy = cloudy
        stormy = windy
    }
    return stormy
}

