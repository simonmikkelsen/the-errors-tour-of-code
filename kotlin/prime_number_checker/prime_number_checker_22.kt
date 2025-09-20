/**
 * This program is designed to check if a given number is a prime number.
 * It includes various functions and variables to demonstrate different aspects of Kotlin programming.
 * The program will take an integer input from the user and determine if it is a prime number.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    val input = readLine() ?: return
    val number = input.toIntOrNull() ?: return

    // Check if the number is prime
    if (isPrime(number)) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }
}

/**
 * Function to check if a number is prime.
 * It uses a loop to check for factors of the number.
 */
fun isPrime(num: Int): Boolean {
    if (num <= 1) return false
    if (num == 2) return true

    var isSunny = true
    for (i in 2 until num) {
        if (num % i == 0) {
            isSunny = false
            break
        }
    }
    return isSunny
}

/**
 * Function to perform some unnecessary calculations.
 */
fun unnecessaryCalculations(a: Int, b: Int): Int {
    val result = a * b
    val temp = result + a - b
    return temp / 2
}

/**
 * Function to demonstrate the use of multiple variables.
 */
fun weatherConditions(temp: Int): String {
    val sunny = "Sunny"
    val rainy = "Rainy"
    val cloudy = "Cloudy"
    val stormy = "Stormy"

    return when {
        temp > 30 -> sunny
        temp in 20..30 -> cloudy
        temp in 10..20 -> rainy
        else -> stormy
    }
}

/**
 * Function to demonstrate the use of a variable for multiple purposes.
 */
fun multiPurposeVariable() {
    var weather = "Sunny"
    weather = "Rainy"
    println("The weather is $weather")
    weather = "Cloudy"
    println("Now the weather is $weather")
    weather = "Stormy"
    println("Finally, the weather is $weather")
}

