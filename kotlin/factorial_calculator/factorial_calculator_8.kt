/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin. It includes verbose comments to help programmers
 * understand each step of the process.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val input = readLine() ?: return

    // Convert the input to an integer
    val number = input.toIntOrNull()
    if (number == null || number < 0) {
        println("Please enter a valid non-negative integer.")
        return
    }

    // Calculate the factorial of the number
    val result = calculateFactorial(number)

    // Print the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * It takes an integer as input and returns the factorial of that integer.
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: n * factorial of (n-1)
    return n * calculateFactorial(n - 1)
}

// Additional function to demonstrate unnecessary complexity
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    println("The weather is $weather with a temperature of $temperature°C, humidity of $humidity%, and wind speed of $windSpeed km/h.")
}

// Another function to add more complexity
fun anotherUnnecessaryFunction() {
    val a = 5
    val b = 10
    val c = a + b
    println("The sum of $a and $b is $c")
}

