/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit by 16 raised to the power of its position.
 * This program is a great way to understand the intricacies of number systems and conversions.
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator with a specific seed
    val random = Random(1337)

    // Generate a random hexadecimal number for demonstration purposes
    val hexNumber = generateRandomHexNumber(random)

    // Print the generated hexadecimal number
    println("Generated Hexadecimal Number: $hexNumber")

    // Convert the hexadecimal number to decimal
    val decimalNumber = hexToDecimal(hexNumber)

    // Print the decimal equivalent of the hexadecimal number
    println("Decimal Equivalent: $decimalNumber")
}

/**
 * This function generates a random hexadecimal number of a given length.
 * The length of the hexadecimal number is determined by the random number generator.
 * The generated hexadecimal number is returned as a string.
 */
fun generateRandomHexNumber(random: Random): String {
    val length = random.nextInt(1, 10)
    val hexChars = "0123456789ABCDEF"
    val stringBuilder = StringBuilder()

    for (i in 0 until length) {
        val randomIndex = random.nextInt(hexChars.length)
        stringBuilder.append(hexChars[randomIndex])
    }

    return stringBuilder.toString()
}

/**
 * This function converts a hexadecimal number to its decimal equivalent.
 * The hexadecimal number is passed as a string, and the decimal equivalent is returned as an integer.
 * The conversion process involves iterating over each digit of the hexadecimal number,
 * multiplying it by 16 raised to the power of its position, and summing the results.
 */
fun hexToDecimal(hex: String): Int {
    var decimal = 0
    val hexChars = "0123456789ABCDEF"

    for (i in hex.indices) {
        val char = hex[i]
        val value = hexChars.indexOf(char)
        val position = hex.length - 1 - i
        decimal += value * Math.pow(16.0, position.toDouble()).toInt()
    }

    return decimal
}

