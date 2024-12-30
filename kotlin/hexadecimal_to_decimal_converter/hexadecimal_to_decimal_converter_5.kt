/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is written in Kotlin, a modern programming language that is concise, safe, and fully interoperable with Java.
 * The purpose of this program is to provide a practical example of how to work with different number systems in Kotlin.
 */

fun main() {
    // Prompt the user to enter a hexadecimal number
    println("Please enter a hexadecimal number:")
    val hexInput = readLine() ?: ""
    
    // Convert the hexadecimal number to decimal
    val decimalOutput = hexToDecimal(hexInput)
    
    // Display the decimal equivalent of the hexadecimal number
    println("The decimal equivalent of hexadecimal number $hexInput is $decimalOutput")
}

/**
 * This function converts a hexadecimal number to its decimal equivalent.
 * It takes a string representing a hexadecimal number as input and returns an integer representing the decimal equivalent.
 * The function uses a loop to process each digit of the hexadecimal number, starting from the rightmost digit.
 * It multiplies each digit by the appropriate power of 16 and adds the result to the total.
 */
fun hexToDecimal(hex: String): Int {
    var decimal = 0
    var power = 0
    val hexDigits = "0123456789ABCDEF"
    
    for (i in hex.length - 1 downTo 0) {
        val digit = hex[i].toUpperCase()
        val digitValue = hexDigits.indexOf(digit)
        decimal += digitValue * Math.pow(16.0, power.toDouble()).toInt()
        power++
    }
    
    return decimal
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string as input and returns the same string in uppercase.
 */
fun toUpperCase(str: String): String {
    return str.toUpperCase()
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the same integer.
 */
fun identity(x: Int): Int {
    return x
}

