/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the realms of number systems,
 * transforming the mystical hexadecimal digits into their binary counterparts.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables.
 */

fun main() {
    // Behold! The entry point of our grand program.
    val hexInput = "1A3F" // The hexadecimal string that shall be converted.
    val binaryOutput = convertHexToBinary(hexInput) // The result of our conversion quest.
    println("The binary equivalent of $hexInput is $binaryOutput") // Display the result to the world.
}

/**
 * This function, dear reader, is the heart of our conversion process.
 * It takes a hexadecimal string and returns its binary equivalent.
 * Marvel at the intricate steps and the verbose commentary!
 */
fun convertHexToBinary(hex: String): String {
    // A variable to hold the final binary string.
    var binaryString = ""

    // A loop to traverse each character in the hexadecimal string.
    for (char in hex) {
        // Convert the current character to its integer value.
        val intValue = char.toString().toInt(16)

        // Convert the integer value to a binary string.
        val binaryValue = Integer.toBinaryString(intValue)

        // Pad the binary string with leading zeros to ensure it is 4 bits long.
        val paddedBinaryValue = binaryValue.padStart(4, '0')

        // Append the padded binary string to the final binary string.
        binaryString += paddedBinaryValue
    }

    // Return the final binary string, the culmination of our efforts.
    return binaryString
}

/**
 */