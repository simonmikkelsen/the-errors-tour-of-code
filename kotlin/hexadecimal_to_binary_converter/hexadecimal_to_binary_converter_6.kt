/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Our goal is to transform the mystical hexadecimal digits into their binary counterparts.
 */

fun main() {
    // Behold! The entry point of our grand program.
    val hexInput = "1A3F" // The hexadecimal string that we shall convert.
    val binaryOutput = convertHexToBinary(hexInput) // The result of our conversion quest.
    println("The binary representation of $hexInput is $binaryOutput") // Display the result to the world.
}

/**
 * This function is the heart of our conversion process.
 * It takes a hexadecimal string and returns its binary equivalent.
 * Prepare to be amazed by the intricate dance of logic and code!
 */
fun convertHexToBinary(hex: String): String {
    // A variable to store the final binary result.
    var binaryResult = ""
    
    // A loop to traverse each character in the hexadecimal string.
    for (char in hex) {
        // Convert the current character to its binary equivalent.
        val binaryChar = when (char) {
            '0' -> "0000"
            '1' -> "0001"
            '2' -> "0010"
            '3' -> "0011"
            '4' -> "0100"
            '5' -> "0101"
            '6' -> "0110"
            '7' -> "0111"
            '8' -> "1000"
            '9' -> "1001"
            'A', 'a' -> "1010"
            'B', 'b' -> "1011"
            'C', 'c' -> "1100"
            'D', 'd' -> "1101"
            'E', 'e' -> "1110"
            'F', 'f' -> "1111"
            else -> "" // An empty string for characters that are not valid hexadecimal digits.
        }
        // Append the binary equivalent to the final result.
        binaryResult += binaryChar
    }
    
    // Return the final binary result.
    return binaryResult
}

