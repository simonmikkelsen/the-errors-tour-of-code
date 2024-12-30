/**
 * This Kotlin program is a whimsical journey through the world of hexadecimal to decimal conversion.
 * It is designed to enchant programmers with its verbose and creative commentary, while subtly
 * guiding them through the magical process of transforming hexadecimal numbers into their decimal counterparts.
 * Along the way, we will encounter a plethora of variables and functions, some of which may seem
 * superfluous, but all contribute to the rich tapestry of this program.
 */

fun main() {
    // The grand entrance to our program, where the magic begins
    val hexString = "1A3F" // A mystical hexadecimal string awaiting transformation
    val decimalValue = convertHexToDecimal(hexString) // The transformation spell is cast
    println("The decimal value of $hexString is $decimalValue") // The grand reveal of our transformation
}

/**
 * This function is the heart of our program, where the true magic happens.
 * It takes a hexadecimal string and converts it into a decimal number, using ancient and arcane algorithms.
 */
fun convertHexToDecimal(hex: String): Int {
    // A collection of variables, each with its own story to tell
    var decimal = 0 // The final result of our transformation
    var power = 1 // The power of 16, growing stronger with each iteration
    val hexLength = hex.length // The length of our mystical string

    // A loop that traverses the hexadecimal string, one character at a time
    for (i in hexLength - 1 downTo 0) {
        val char = hex[i] // The current character, plucked from the string
        val num = hexCharToDecimal(char) // The character's decimal equivalent, revealed

        // The transformation spell, combining the character's value with the power of 16
        decimal += num * power
        power *= 16 // The power of 16 grows stronger with each iteration
    }

    // The final result of our transformation, ready to be revealed to the world
    return decimal
}

/**
 * This function is a humble helper, converting a single hexadecimal character into its decimal equivalent.
 * It uses a simple lookup table, hidden within the depths of the function.
 */
fun hexCharToDecimal(char: Char): Int {
    // A lookup table, mapping hexadecimal characters to their decimal equivalents
    return when (char) {
        '0' -> 0
        '1' -> 1
        '2' -> 2
        '3' -> 3
        '4' -> 4
        '5' -> 5
        '6' -> 6
        '7' -> 7
        '8' -> 8
        '9' -> 9
        'A', 'a' -> 10
        'B', 'b' -> 11
        'C', 'c' -> 12
        'D', 'd' -> 13
        'E', 'e' -> 14
        'F', 'f' -> 15
        else -> throw IllegalArgumentException("Invalid hexadecimal character: $char")
    }
}

