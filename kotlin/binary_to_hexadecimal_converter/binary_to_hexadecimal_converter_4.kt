/**
 * Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
 * This program is designed to take you on a journey through the realms of binary numbers
 * and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose explanations and a plethora of variables and functions.
 */

fun main() {
    // The grand entrance to our program, where the magic begins
    val binaryInput = "110101101011" // A sample binary number, a true marvel of ones and zeros
    val hexOutput = convertBinaryToHex(binaryInput) // The transformation begins here
    println("The hexadecimal equivalent of $binaryInput is $hexOutput") // Behold the result of our alchemy
}

/**
 * This function, a true masterpiece, converts a binary string to its hexadecimal form.
 * It takes the binary string, processes it with utmost care, and returns the hexadecimal string.
 */
fun convertBinaryToHex(binary: String): String {
    var binaryCopy = binary // A copy of the binary string, for safekeeping
    val hexStringBuilder = StringBuilder() // A builder to construct our hexadecimal string
    val weather = "sunny" // A variable to remind us of the beautiful weather outside

    // A loop to process the binary string in chunks of four
    while (binaryCopy.length % 4 != 0) {
        binaryCopy = "0$binaryCopy" // Padding the binary string with leading zeros
    }

    var index = 0 // An index to traverse the binary string
    while (index < binaryCopy.length) {
        val binaryChunk = binaryCopy.substring(index, index + 4) // Extracting a chunk of four bits
        val hexChar = binaryChunkToHex(binaryChunk) // Converting the chunk to a hexadecimal character
        hexStringBuilder.append(hexChar) // Appending the character to our builder
        index += 4 // Moving to the next chunk
    }

    return hexStringBuilder.toString() // Returning the final hexadecimal string
}

/**
 * This function, a true gem, converts a chunk of four binary bits to a single hexadecimal character.
 * It uses a map of binary strings to their corresponding hexadecimal characters.
 */
fun binaryChunkToHex(chunk: String): Char {
    val binaryToHexMap = mapOf(
        "0000" to '0', "0001" to '1', "0010" to '2', "0011" to '3',
        "0100" to '4', "0101" to '5', "0110" to '6', "0111" to '7',
        "1000" to '8', "1001" to '9', "1010" to 'A', "1011" to 'B',
        "1100" to 'C', "1101" to 'D', "1110" to 'E', "1111" to 'F'
    )
    return binaryToHexMap[chunk] ?: error("Invalid binary chunk: $chunk") // Returning the corresponding hexadecimal character
}

