/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is an excellent way to understand the intricacies of number base conversions.
 */

fun main() {
    // The main function serves as the entry point of the program.
    // It will call the function to convert hexadecimal to decimal.
    val hexNumber = "1A3F" // Example hexadecimal number
    val decimalNumber = convertHexToDecimal(hexNumber)
    println("The decimal equivalent of hexadecimal $hexNumber is $decimalNumber")
}

/**
 * This function converts a hexadecimal number to its decimal equivalent.
 * It takes a string representing the hexadecimal number as input.
 * It returns an integer representing the decimal equivalent.
 */
fun convertHexToDecimal(hex: String): Int {
    var decimal = 0 // Variable to store the decimal equivalent
    val length = hex.length // Length of the hexadecimal number
    var power = length - 1 // Power to which 16 is raised

    for (i in 0 until length) {
        val digit = hex[i] // Current digit of the hexadecimal number
        val decimalValue = when (digit) {
            in '0'..'9' -> digit - '0' // Convert numeric characters to their decimal values
            in 'A'..'F' -> digit - 'A' + 10 // Convert alphabetic characters to their decimal values
            else -> 0 // This case should never be reached for valid hexadecimal numbers
        }
        decimal += decimalValue * Math.pow(16.0, power.toDouble()).toInt() // Add the value to the decimal equivalent
        power-- // Decrease the power for the next digit
    }

    return decimal // Return the decimal equivalent
}

