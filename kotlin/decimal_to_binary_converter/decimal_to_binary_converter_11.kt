/**
 * This program is a decimal to binary converter written in Kotlin.
 * The purpose of this program is to provide a detailed and verbose example
 * of how to convert a decimal number to its binary representation.
 * The program uses regular expressions extensively to demonstrate their usage.
 * It also includes a variety of comments to explain each step in detail.
 */

fun main() {
    // The main function is the entry point of the program.
    // It calls the convertDecimalToBinary function with a sample input.
    val sampleInput = 42
    val binaryOutput = convertDecimalToBinary(sampleInput)
    println("The binary representation of $sampleInput is $binaryOutput")
}

/**
 * This function converts a decimal number to its binary representation.
 * It uses regular expressions to perform the conversion.
 * @param decimal The decimal number to be converted.
 * @return The binary representation of the decimal number.
 */
fun convertDecimalToBinary(decimal: Int): String {
    // Initialize a variable to store the binary representation.
    var binary = ""
    
    // Initialize a variable to store the current decimal value.
    var currentDecimal = decimal
    
    // Loop until the current decimal value is greater than zero.
    while (currentDecimal > 0) {
        // Calculate the remainder when the current decimal value is divided by 2.
        val remainder = currentDecimal % 2
        
        // Prepend the remainder to the binary representation.
        binary = remainder.toString() + binary
        
        // Update the current decimal value by dividing it by 2.
        currentDecimal /= 2
    }
    
    // Use a regular expression to ensure the binary representation is valid.
    val binaryRegex = Regex("^[01]+$")
    if (!binaryRegex.matches(binary)) {
        throw IllegalArgumentException("Invalid binary representation: $binary")
    }
    
    // Return the binary representation.
    return binary
}

/**
 * This function is not needed but demonstrates the use of regular expressions.
 * It checks if a string is a valid binary number.
 * @param binary The string to be checked.
 * @return True if the string is a valid binary number, false otherwise.
 */
fun isValidBinary(binary: String): Boolean {
    // Use a regular expression to check if the string is a valid binary number.
    val binaryRegex = Regex("^[01]+$")
    return binaryRegex.matches(binary)
}

/**
 * This function is not needed but demonstrates the use of regular expressions.
 * It converts a binary number to its decimal representation.
 * @param binary The binary number to be converted.
 * @return The decimal representation of the binary number.
 */
fun convertBinaryToDecimal(binary: String): Int {
    // Initialize a variable to store the decimal representation.
    var decimal = 0
    
    // Loop through each character in the binary string.
    for (i in binary.indices) {
        // Get the current character.
        val char = binary[i]
        
        // Calculate the value of the current character.
        val value = char.toString().toInt() * Math.pow(2.0, (binary.length - 1 - i).toDouble()).toInt()
        
        // Add the value to the decimal representation.
        decimal += value
    }
    
    // Return the decimal representation.
    return decimal
}

