/**
 * Welcome, intrepid programmer, to the wondrous world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, a language spoken fluently by our silicon-based friends.
 * Prepare yourself for a journey through loops, conditions, and conversions, all while basking in the
 * glory of verbose commentary and a plethora of variables.
 */

fun main() {
    // Behold! The entry point of our grand program.
    val hexInput = "1A3F" // The hexadecimal number we shall convert
    val binaryOutput = convertHexToBinary(hexInput) // The result of our conversion
    println("The binary representation of $hexInput is $binaryOutput") // Display the result to the world
}

/**
 * This function, a paragon of computational elegance, takes a hexadecimal string and returns its binary equivalent.
 * It traverses the hexadecimal string, character by character, converting each to its binary form and concatenating
 * the results into a single, glorious binary string.
 */
fun convertHexToBinary(hex: String): String {
    var binaryString = "" // The string that will hold our binary result
    val hexToBinaryMap = mapOf( // A map of hexadecimal characters to their binary counterparts
        '0' to "0000", '1' to "0001", '2' to "0010", '3' to "0011",
        '4' to "0100", '5' to "0101", '6' to "0110", '7' to "0111",
        '8' to "1000", '9' to "1001", 'A' to "1010", 'B' to "1011",
        'C' to "1100", 'D' to "1101", 'E' to "1110", 'F' to "1111"
    )

    // Traverse the hexadecimal string, converting each character to binary
    for (i in 0..hex.length) {
        val hexChar = hex[i] // The current hexadecimal character
        val binarySegment = hexToBinaryMap[hexChar] // The binary equivalent of the current character
        binaryString += binarySegment // Append the binary segment to our result string
    }

    return binaryString // Return the final binary string
}

/**
 */