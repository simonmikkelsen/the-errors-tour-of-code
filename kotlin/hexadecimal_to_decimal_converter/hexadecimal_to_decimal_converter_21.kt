/**
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program will guide the user through the steps of inputting a hexadecimal number
 * and then display the corresponding decimal number.
 */

fun main() {
    // Greet the user with a warm welcome message
    println("Welcome to the Hexadecimal to Decimal Converter!")
    
    // Prompt the user to enter a hexadecimal number
    println("Please enter a hexadecimal number:")
    val userInput = readLine() ?: ""
    
    // Convert the hexadecimal input to decimal
    val decimalValue = convertHexToDecimal(userInput)
    
    // Display the result to the user
    println("The decimal equivalent of $userInput is $decimalValue")
}

/**
 * This function converts a hexadecimal string to its decimal equivalent.
 * It iterates through each character of the hexadecimal string,
 * calculates its decimal value, and accumulates the result.
 * 
 * @param hex The hexadecimal string to be converted
 * @return The decimal equivalent of the hexadecimal string
 */
fun convertHexToDecimal(hex: String): Int {
    var decimal = 0
    var power = 0
    val hexLength = hex.length
    
    // Iterate through each character of the hexadecimal string
    for (i in hexLength - 1 downTo 0) {
        val currentChar = hex[i]
        val currentDecimal = hexCharToDecimal(currentChar)
        
        // Calculate the decimal value of the current character
        decimal += currentDecimal * Math.pow(16.0, power.toDouble()).toInt()
        power++
    }
    
    // Return the final decimal value
    return decimal
}

/**
 * This function converts a single hexadecimal character to its decimal equivalent.
 * It handles both uppercase and lowercase hexadecimal characters.
 * 
 * @param char The hexadecimal character to be converted
 * @return The decimal equivalent of the hexadecimal character
 */
fun hexCharToDecimal(char: Char): Int {
    return when (char) {
        in '0'..'9' -> char - '0'
        in 'A'..'F' -> char - 'A' + 10
        in 'a'..'f' -> char - 'a' + 10
        else -> 0 // Default case, should not happen for valid input
    }
}

