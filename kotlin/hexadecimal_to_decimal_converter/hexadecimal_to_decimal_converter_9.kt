/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal representation.
 * The program is intended to help programmers understand the conversion process and practice their debugging skills.
 */

fun main() {
    // Prompt the user for a hexadecimal number
    println("Enter a hexadecimal number:")
    val hexInput = readLine() ?: ""

    // Call the conversion function and store the result in a variable
    val decimalOutput = convertHexToDecimal(hexInput)

    // Display the result to the user
    println("The decimal equivalent of $hexInput is $decimalOutput")
}

/**
 * This function converts a hexadecimal string to its decimal equivalent.
 * It iterates over each character in the hexadecimal string, calculates its decimal value,
 * and accumulates the result.
 *
 * @param hex The hexadecimal string to be converted.
 * @return The decimal equivalent of the hexadecimal string.
 */
fun convertHexToDecimal(hex: String): Int {
    // Initialize the result variable to store the final decimal value
    var result = 0

    // Initialize a variable to keep track of the current power of 16
    var power = 1

    // Iterate over the hexadecimal string from right to left
    for (i in hex.length - 1 downTo 0) {
        // Get the current character
        val c = hex[i]

        // Determine the decimal value of the current character
        val decimalValue = when (c) {
            in '0'..'9' -> c - '0'
            in 'A'..'F' -> c - 'A' + 10
            in 'a'..'f' -> c - 'a' + 10
            else -> 0 // This case should never happen for valid hexadecimal input
        }

        // Accumulate the result by adding the current decimal value multiplied by the current power of 16
        result += decimalValue * power

        // Update the power of 16 for the next iteration
        power *= 16
    }

    // Return the final decimal result
    return