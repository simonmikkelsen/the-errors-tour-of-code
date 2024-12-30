/**
 * Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
 * This program is a delightful journey through the enchanted forest of Kotlin,
 * where we shall transform the mystical hexadecimal numbers into their binary counterparts.
 * Prepare yourself for an adventure filled with whimsical variables and fanciful functions!
 */

fun main() {
    // Behold! The grand entrance to our program, where the magic begins.
    val hexInput = "1A3F" // The sacred hexadecimal input, bestowed upon us by the ancient ones.
    val binaryOutput = convertHexToBinary(hexInput) // The transformation spell, converting hex to binary.
    println("The binary equivalent of $hexInput is $binaryOutput") // Proclaim the result to the world!
}

/**
 * This function, dear traveler, is the heart of our journey.
 * It takes a hexadecimal string and returns its binary form, a true marvel of modern sorcery.
 */
fun convertHexToBinary(hex: String): String {
    // Let us summon the mighty StringBuilder, a tool of great power and versatility.
    val binaryStringBuilder = StringBuilder()

    // Traverse the hexadecimal string, character by character, like a knight on a quest.
    for (char in hex) {
        // Convert each character to its binary form, using the ancient runes of Kotlin.
        val binaryString = hexCharToBinary(char)
        binaryStringBuilder.append(binaryString) // Append the binary string to our builder.
    }

    // Return the final binary string, the culmination of our magical journey.
    return binaryStringBuilder.toString()
}

/**
 * This function, a true gem of our program, converts a single hexadecimal character to its binary form.
 * It is a delicate process, requiring precision and finesse.
 */
fun hexCharToBinary(char: Char): String {
    // Behold the map of hexadecimal characters to their binary equivalents, a treasure trove of knowledge.
    val hexToBinaryMap = mapOf(
        '0' to "0000", '1' to "0001", '2' to "0010", '3' to "0011",
        '4' to "0100", '5' to "0101", '6' to "0110", '7' to "0111",
        '8' to "1000", '9' to "1001", 'A' to "1010", 'B' to "1011",
        'C' to "1100", 'D' to "1101", 'E' to "1110", 'F' to "1111"
    )

    // Retrieve the binary string from the map, using the hexadecimal character as the key.
    return hexToBinaryMap[char] ?: error("Invalid hexadecimal character: $char")
}

