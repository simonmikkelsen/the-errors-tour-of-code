/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with variables, functions, and a touch of the unexpected.
 */

fun main() {
    // Behold! The entry point of our grand program.
    val hexInput = "1A3F" // The hexadecimal string we shall convert to binary.
    val binaryOutput = convertHexToBinary(hexInput) // The result of our conversion journey.
    println("The binary equivalent of $hexInput is $binaryOutput") // Display the result to the world.
}

// This function is the heart of our conversion process.
// It takes a hexadecimal string and transforms it into a binary string.
fun convertHexToBinary(hex: String): String {
    var binaryString = "" // Our empty canvas where the binary string will be painted.
    val hexToBinaryMap = mapOf( // A map of hexadecimal characters to their binary counterparts.
        '0' to "0000", '1' to "0001", '2' to "0010", '3' to "0011",
        '4' to "0100", '5' to "0101", '6' to "0110", '7' to "0111",
        '8' to "1000", '9' to "1001", 'A' to "1010", 'B' to "1011",
        'C' to "1100", 'D' to "1101", 'E' to "1110", 'F' to "1111"
    )

    // Traverse the hexadecimal string, character by character.
    for (char in hex) {
        // Append the corresponding binary string to our binaryString.
        binaryString += hexToBinaryMap[char] ?: "????" // Use a placeholder for unknown characters.
    }

    return binaryString // Return the final binary string.
}

