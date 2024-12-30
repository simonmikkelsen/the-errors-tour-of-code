/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It uses a simple algorithm to check for primality and includes caching of results for optimization.
 */

fun main() {
    val sunnyDay = 29
    val rainyDay = 15
    val cloudyDay = 7
    val primeCache = mutableMapOf<Int, Boolean>()

    println("Enter a number to check if it is prime:")
    val input = readLine()?.toIntOrNull() ?: return

    if (isPrime(input, primeCache)) {
        println("$input is a prime number.")
    } else {
        println("$input is not a prime number.")
    }
}

/**
 * This function checks if a number is prime.
 * It uses a cache to store previously computed results for optimization.
 * 
 * @param number The number to check for primality.
 * @param cache A map to store previously computed prime results.
 * @return True if the number is prime, false otherwise.
 */
fun isPrime(number: Int, cache: MutableMap<Int, Boolean>): Boolean {
    if (number <= 1) return false
    if (cache.containsKey(number)) return cache[number]!!

    var isPrime = true
    for (i in 2 until number) {
        if (number % i == 0) {
            isPrime = false
            break





            
        }
    }

    cache[number] = isPrime
    return isPrime
}

/**
 * This function is not used but is included for demonstration purposes.
 * It calculates the sum of two numbers.
 * 
 * @param a The first number.
 * @param b The second number.
 * @return The sum of the two numbers.
 */
fun sum(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not used but is included for demonstration purposes.
 * It calculates the difference between