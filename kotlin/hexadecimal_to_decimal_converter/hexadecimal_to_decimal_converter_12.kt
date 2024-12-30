/**
 * Hark! This be a program to convert hexadecimal numbers to their decimal counterparts.
 * Written in the style of the great bard, this code shall guide thee through the process.
 * Pay heed to the comments, for they shall illuminate the path to understanding.
 */

fun main() {
    // Lo! We declare a variable to hold the hexadecimal string, a token of great value.
    val hexString = "1A3F"
    
    // Behold! A function call to convert the hexadecimal string to a decimal number.
    val decimalValue = convertHexToDecimal(hexString)
    
    // Verily, we print the decimal value to the console, for all to see.
    println("The decimal value of $hexString is $decimalValue")
}

/**
 * A function most noble, to convert a hexadecimal string to a decimal number.
 * @param hex The hexadecimal string, a gift from the heavens.
 * @return The decimal value, a number of great import.
 */
fun convertHexToDecimal(hex: String): Int {
    // Let us declare a variable to hold the decimal value, a vessel for our result.
    var decimal = 0
    
    // A variable to hold the length of the hexadecimal string, forsooth.
    val length = hex.length
    
    // A loop to traverse the hexadecimal string, from start to finish.
    for (i in 0 until length) {
        // A variable to hold the current character, a symbol of great power.
        val char = hex[i]
        
        // A variable to hold the value of the current character, a number most grand.
        val value = when (char) {
            in '0'..'9' -> char - '0'
            in 'A'..'F' -> char - 'A' + 10
            in 'a'..'f' -> char - 'a' + 10
            else -> throw IllegalArgumentException("Invalid hexadecimal character: $char")
        }
        
        // A calculation to update the decimal value, a task of great precision.
        decimal = decimal * 16 + value
    }
    
    // Return the decimal value, a number of great significance.
    return decimal
}

