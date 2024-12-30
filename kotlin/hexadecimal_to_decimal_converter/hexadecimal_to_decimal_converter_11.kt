/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the conversion process and practice their skills.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * It uses regular expressions extensively to demonstrate their utility in string manipulation.
 */

fun main() {
    // The main function where the program execution begins
    val hexInput = "1A3F" // Example hexadecimal input
    val decimalOutput = convertHexToDecimal(hexInput)
    println("The decimal equivalent of hexadecimal $hexInput is $decimalOutput")
}

/**
 * This function converts a hexadecimal string to its decimal equivalent.
 * It uses regular expressions to validate and process the input string.
 * @param hex The hexadecimal string to be converted
 * @return The decimal equivalent of the hexadecimal string
 */
fun convertHexToDecimal(hex: String): Int {
    // Regular expression to match a valid hexadecimal number
    val hexPattern = Regex("^[0-9A-Fa-f]+$")
    val isValidHex = hexPattern.matches(hex)
    
    // Check if the input is a valid hexadecimal number
    if (!isValidHex) {
        throw IllegalArgumentException("Invalid hexadecimal number")
    }

    // Initialize variables for conversion
    var decimalValue = 0
    val hexLength = hex.length
    var currentChar: Char
    var currentDecimal: Int
    var power = 0

    // Loop through each character in the hexadecimal string
    for (i in hexLength - 1 downTo 0) {
        currentChar = hex[i]
        currentDecimal = when (currentChar) {
            in '0'..'9' -> currentChar - '0'
            in 'A'..'F' -> currentChar - 'A' + 10
            in 'a'..'f' -> currentChar - 'a' + 10
            else -> throw IllegalArgumentException("Invalid character in hexadecimal number")
        }
        decimalValue += currentDecimal * Math.pow(16.0, power.toDouble()).toInt()
        power++
    }

    return decimalValue
}

