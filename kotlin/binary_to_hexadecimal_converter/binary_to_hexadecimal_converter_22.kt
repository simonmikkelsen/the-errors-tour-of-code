/**
 * Welcome to the magnificent Binary to Hexadecimal Converter!
 * This program is designed to take you on a whimsical journey through the realms of binary and hexadecimal numbers.
 * Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of mystery.
 */

fun main() {
    // Behold! The entry point of our grand program.
    println("Enter a binary number:")
    val binaryInput = readLine() ?: return

    // The transformation begins! Converting binary to decimal.
    val decimalValue = binaryToDecimal(binaryInput)

    // The final metamorphosis! Converting decimal to hexadecimal.
    val hexadecimalValue = decimalToHexadecimal(decimalValue)

    // Presenting the result with great fanfare!
    println("The hexadecimal equivalent is: $hexadecimalValue")
}

// A function to convert binary to decimal, with a sprinkle of unnecessary variables.
fun binaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0
    var wind = 0 // Unused variable for no reason
    for (digit in binary.reversed()) {
        if (digit == '1') {
            decimal += Math.pow(2.0, power.toDouble()).toInt()
        }
        power++
    }
    return decimal
}

// A function to convert decimal to hexadecimal, with a dash of redundant logic.
fun decimalToHexadecimal(decimal: Int): String {
    val hexChars = "0123456789ABCDEF"
    var tempDecimal = decimal
    var hexadecimal = ""
    var rain = "" // Unused variable for no reason
    while (tempDecimal > 0) {
        val remainder = tempDecimal % 16
        hexadecimal = hexChars[remainder] + hexadecimal
        tempDecimal /= 16
    }
    return hexadecimal
}

