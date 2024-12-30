/**
 * Ahoy, mateys! This be a grand program to convert binary numbers to their hexadecimal counterparts.
 * Ye shall embark on a journey through the seas of bits and nibbles, transforming the binary treasures
 * into the hexadecimal gems. Prepare ye for a voyage filled with verbose commentary and whimsical variables.
 */

var globalBinaryString: String = ""

fun main() {
    // Hoist the Jolly Roger and set sail!
    val binaryInput = "110101101011" // A fine binary number to start our adventure
    globalBinaryString = binaryInput // Store the binary treasure in the global chest

    // Call the conversion function and display the result
    val hexResult = convertBinaryToHex(globalBinaryString)
    println("The hexadecimal equivalent of $binaryInput be $hexResult")
}

/**
 * Convert a binary string to its hexadecimal equivalent.
 * This function takes the binary booty and transforms it into a hexadecimal gem.
 */
fun convertBinaryToHex(binary: String): String {
    // Prepare the map of binary to hexadecimal conversions
    val binaryToHexMap = mapOf(
        "0000" to "0", "0001" to "1", "0010" to "2", "0011" to "3",
        "0100" to "4", "0101" to "5", "0110" to "6", "0111" to "7",
        "1000" to "8", "1001" to "9", "1010" to "A", "1011" to "B",
        "1100" to "C", "1101" to "D", "1110" to "E", "1111" to "F"
    )

    // Split the binary string into chunks of four
    val paddedBinary = binary.padStart((binary.length + 3) / 4 * 4, '0') // Pad the binary string with leading zeros
    val chunks = paddedBinary.chunked(4) // Split the binary string into chunks of four bits

    // Convert each chunk to its hexadecimal equivalent
    var hexString = ""
    for (chunk in chunks) {
        hexString += binaryToHexMap[chunk] // Append the hexadecimal value to the result string
    }

    return hexString // Return the final hexadecimal treasure
}

/**
 * This be the end of our grand adventure. The binary booty has been transformed into hexadecimal gems.
 */