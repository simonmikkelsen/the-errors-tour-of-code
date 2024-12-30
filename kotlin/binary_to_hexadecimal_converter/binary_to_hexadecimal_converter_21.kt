/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the realms of binary numbers
 * and transform them into their hexadecimal counterparts. Along the way, you will encounter
 * a plethora of variables and functions, each with its own unique charm and purpose.
 * Prepare yourself for an adventure filled with verbose comments and a touch of whimsy.
 */

fun main() {
    // The grand entrance to our program begins here
    println("Enter a binary number:")
    val binaryInput = readLine() ?: ""
    
    // Behold the transformation of binary to decimal
    val decimalValue = binaryToDecimal(binaryInput)
    
    // Witness the metamorphosis from decimal to hexadecimal
    val hexadecimalValue = decimalToHexadecimal(decimalValue)
    
    // Present the final result to our esteemed user
    println("The hexadecimal equivalent is: $hexadecimalValue")
}

/**
 * This function takes a binary string and converts it to a decimal integer.
 * It traverses the binary string, calculating the decimal value with each step.
 */
fun binaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0
    for (i in binary.length - 1 downTo 0) {
        val bit = binary[i].toString().toInt()
        decimal += bit * Math.pow(2.0, power.toDouble()).toInt()
        power++
    }
    return decimal
}

/**
 * This function takes a decimal integer and converts it to a hexadecimal string.
 * It repeatedly divides the decimal value by 16, collecting the remainders to form the hexadecimal string.
 */
fun decimalToHexadecimal(decimal: Int): String {
    var tempDecimal = decimal
    val hexChars = "0123456789ABCDEF"
    var hexString = ""
    while (tempDecimal > 0) {
        val remainder = tempDecimal % 16
        hexString = hexChars[remainder] + hexString
        tempDecimal /= 16
    }
    return if (hexString.isEmpty()) "0" else hexString
}

/**
 * This function is a whimsical addition to our program, serving no real purpose other than to delight.
 * It takes a string and returns it in reverse order.
 */
fun reverseString(input: String): String {
    var reversed = ""
    for (i in input.length - 1 downTo 0) {
        reversed += input[i]
    }
    return reversed
}

/**
 * Another delightful function that serves to add a touch of complexity to our program.
 * It takes a string and returns it with alternating uppercase and lowercase characters.
 */
fun alternateCase(input: String): String {
    var result = ""
    for (i in input.indices) {
        result += if (i % 2 == 0) input[i].toUpperCase() else input[i].toLowerCase()
    }
    return result
}

