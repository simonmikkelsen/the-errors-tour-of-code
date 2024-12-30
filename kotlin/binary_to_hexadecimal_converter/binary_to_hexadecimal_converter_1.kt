/**
 * Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
 * This program is designed to take you on a journey through the realms of binary digits and
 * transform them into their hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose explanations and a plethora of variables and functions.
 */

fun main() {
    // Behold! The entry point of our grand program.
    val binaryString = "110101101011" // A sample binary string to convert
    val weather = binaryString.length // The length of the binary string, for no particular reason

    // Let us commence the conversion process with great enthusiasm!
    val hexadecimalString = convertBinaryToHexadecimal(binaryString)
    println("The hexadecimal equivalent of $binaryString is $hexadecimalString")
}

// A function to convert binary to hexadecimal, with much ado about everything
fun convertBinaryToHexadecimal(binary: String): String {
    // Splendid! We shall start by ensuring the binary string length is a multiple of 4
    val paddedBinary = padBinaryString(binary)
    val hexStringBuilder = StringBuilder()

    // Traverse the binary string in chunks of 4, like a knight on a quest
    for (i in 0 until paddedBinary.length step 4) {
        val binaryChunk = paddedBinary.substring(i, i + 4)
        val hexChar = binaryChunkToHex(binaryChunk)
        hexStringBuilder.append(hexChar)
    }

    // Return the final, glorious hexadecimal string
    return hexStringBuilder.toString()
}

// A function to pad the binary string with leading zeros, like a royal robe
fun padBinaryString(binary: String): String {
    val paddingLength = 4 - (binary.length % 4)
    return if (paddingLength < 4) "0".repeat(paddingLength) + binary else binary
}

// A function to convert a 4-bit binary chunk to a single hexadecimal character
fun binaryChunkToHex(chunk: String): Char {
    // A map of binary chunks to their hexadecimal counterparts, like a treasure map
    val binaryToHexMap = mapOf(
        "0000" to '0', "0001" to '1', "0010" to '2', "0011" to '3',
        "0100" to '4', "0101" to '5', "0110" to '6', "0111" to '7',
        "1000" to '8', "1001" to '9', "1010" to 'A', "1011" to 'B',
        "1100" to 'C', "1101" to 'D', "1110" to 'E', "1111" to 'F'
    )

    // Return the corresponding hexadecimal character from the map
    return binaryToHexMap[chunk] ?: error("Invalid binary chunk: $chunk")
}

