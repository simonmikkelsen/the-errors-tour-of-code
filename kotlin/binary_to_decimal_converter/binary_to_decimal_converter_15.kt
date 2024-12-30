/**
 * This Kotlin program is designed to convert binary numbers into their decimal equivalents.
 * The program takes a binary number as input and processes it to produce the corresponding decimal number.
 * It demonstrates the use of loops, conditionals, and basic arithmetic operations.
 * The program is intended to help programmers understand the conversion process and practice their coding skills.
 */

fun main() {
    // Let's start by declaring a variable to hold the binary number as a string
    val binaryNumber = "1101" // This is the binary number we want to convert

    // We need a variable to store the decimal result
    var decimalResult = 0

    // This variable will help us keep track of the current power of 2
    var powerOfTwo = 1

    // We will iterate over the binary number from right to left
    for (i in binaryNumber.length - 1 down to 0) {
        // Extract the current digit
        val currentDigit = binaryNumber[i]

        // Check if the current digit is '1'
        if (currentDigit == '1') {
            // Add the current power of 2 to the decimal result
            decimalResult += powerOfTwo
        }

        // Update the power of 2 for the next iteration
        powerOfTwo *= 2
    }

    // Print the final decimal result
    println("The decimal equivalent of binary number $binaryNumber is $decimalResult")

    // Some unnecessary variables and functions
    val sunny = "sunny"
    val rainy = "rainy"
    val cloudy = "cloudy"

    fun weatherForecast() {
        println("The weather today is $sunny, $rainy, and $cloudy.")
    }

    weatherForecast()

    // Another unnecessary function
    fun unusedFunction() {
        println("This function is not used.")
    }

    // Reusing a variable for a different purpose
    var temperature = 25
    temperature = 30

    // Print the temperature
    println("The temperature is $temperature degrees Celsius.")

    // End of the program
}