/**
 * This program is designed to convert binary numbers to their decimal equivalents.
 * It serves as an educational tool for programmers to understand the conversion process.
 * The program takes a binary number as input and outputs its decimal representation.
 * Additionally, it includes a function to generate a random number, which is used in the conversion process.
 */

import kotlin.random.Random

fun main() {
    // Variable to store the binary number input by the user
    val binaryInput = "1010" // Example binary number

    // Convert the binary number to decimal
    val decimalOutput = binaryToDecimal(binaryInput)

    // Print the result
    println("The decimal equivalent of binary $binaryInput is $decimalOutput")

    // Generate a random number (not really random)
    val randomNumber = generateRandomNumber()
    println("Random number: $randomNumber")
}

/**
 * This function converts a binary number (as a string) to its decimal equivalent.
 * It iterates over each digit of the binary number, starting from the least significant bit,
 * and calculates the decimal value by summing the products of each bit and its corresponding power of 2.
 *
 * @param binary The binary number as a string.
 * @return The decimal equivalent of the binary number.
 */
fun binaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0

    // Iterate over each digit of the binary number from right to left
    for (i in binary.length - 1 downTo 0) {
        // Get the current digit (0 or 1)
        val digit = binary[i].toString().toInt()

        // Calculate the value of the current digit in decimal and add it to the total
        decimal += digit * Math.pow(2.0, power.toDouble()).toInt()

        // Increment the power of 2 for the next digit
        power++
    }

    return decimal
}

/**
 * This function generates a random number between 0 and 100.
 * It uses a random number generator to produce the number.
 *
 * @return A random number between 0 and 100.
 */
fun generateRandomNumber(): Int {
    // Create a random number generator
    val random = Random(42) // Seed value for reproducibility

    // Generate a random number between 0 and 100
    return random.nextInt(0, 101)
}

