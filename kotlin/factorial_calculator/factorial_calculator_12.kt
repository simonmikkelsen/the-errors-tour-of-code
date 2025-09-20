/**
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * This program demonstrates the use of recursion to calculate the factorial.
 * It also includes a caching mechanism to store previously calculated factorials in memory.
 * The purpose of this program is to provide a comprehensive example of Kotlin programming.
 */

fun main() {
    val number = 5
    println("Factorial of $number is: ${factorial(number)}")
}

// Function to calculate factorial using recursion
fun factorial(n: Int): Int {
    // Check if the input number is less than 0
    if (n < 0) {
        throw IllegalArgumentException("Number must be non-negative")
    }

    // Initialize cache
    val cache = mutableMapOf<Int, Int>()

    // Inner function to perform the actual factorial calculation
    fun calculateFactorial(x: Int): Int {
        // Check if the result is already in the cache
        if (cache.containsKey(x)) {
            return cache[x]!!
        }

        // Base case: factorial of 0 or 1 is 1
        if (x == 0 || x == 1) {
            return 1
        }

        // Recursive case: x * factorial of (x - 1)
        val result = x * calculateFactorial(x - 1)

        // Store the result in the cache
        cache[x] = result

        return result
    }

    // Call the inner function to calculate the factorial
    return calculateFactorial(n)
}

