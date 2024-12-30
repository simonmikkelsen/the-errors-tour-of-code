/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of conversion and practice their debugging skills.
 * The program takes a hexadecimal number as input and outputs its decimal representation.
 * It includes detailed comments to explain each step of the process.
 */

fun main() {
    // The hexadecimal number to be converted
    val hexNumber = "1A3F"
    
    // Call the conversion function and store the result
    val decimalNumber = convertHexToDecimal(hexNumber)
    
    // Print the result to the console
    println("The decimal equivalent of hexadecimal $hexNumber is $decimalNumber")
}

/**
 * This function converts a hexadecimal number to its decimal equivalent.
 * It iterates over each character in the hexadecimal string, calculates its decimal value,
 * and accumulates the result.
 *
 * @param hex The hexadecimal number as a string
 * @return The decimal equivalent as an integer
 */
fun convertHexToDecimal(hex: String): Int {
    // Initialize the result variable to store the decimal value
    var result = 0
    
    // Initialize a variable to keep track of the current power of 16
    var power = 1
    
    // Iterate over the characters in the hexadecimal string from right to left
    for (i in hex.length - 1 downTo 0) {
        // Get the current character
        val c = hex[i]
        
        // Determine the decimal value of the current character
        val decimalValue = when (c) {
            in '0'..'9' -> c - '0'
            in 'A'..'F' -> c - 'A' + 10
            in 'a'..'f' -> c - 'a' + 10
            else -> throw IllegalArgumentException("Invalid hexadecimal character: $c")
        }
        
        // Accumulate the result by adding the current decimal value multiplied by the current power of 16
        result += decimalValue * power
        
        // Update the power of 16 for the next iteration
        power *= 16
    }
    
    // Return the final result
    return result
}

