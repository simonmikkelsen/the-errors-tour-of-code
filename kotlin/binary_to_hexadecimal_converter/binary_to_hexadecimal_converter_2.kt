/**
 * Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
 * This program is a delightful journey through the lands of binary digits,
 * transforming them into the majestic hexadecimal format.
 * Prepare yourself for an adventure filled with whimsical variables and
 * enchanting functions, all designed to make your coding experience
 * as magical as possible.
 */

fun main() {
    // Behold! The binary string, a humble servant awaiting transformation.
    val binaryString = "110101101011"

    // The grand conversion begins! Witness the binary string morph into a hexadecimal wonder.
    val hexadecimalString = convertBinaryToHex(binaryString)

    // The final reveal! The hexadecimal string is presented in all its glory.
    println("The hexadecimal representation of $binaryString is $hexadecimalString")
}

// A function of great importance, tasked with the noble duty of converting binary to hexadecimal.
fun convertBinaryToHex(binary: String): String {
    // A variable to hold the hexadecimal result, like a treasure chest waiting to be filled.
    var hexResult = ""

    // A map of binary to hexadecimal conversions, akin to a magical spellbook.
    val binaryToHexMap = mapOf(
        "0000" to "0", "0001" to "1", "0010" to "2", "0011" to "3",
        "0100" to "4", "0101" to "5", "0110" to "6", "0111" to "7",
        "1000" to "8", "1001" to "9", "1010" to "A", "1011" to "B",
        "1100" to "C", "1101" to "D", "1110" to "E", "1111" to "F"
    )

    // A loop that dances through the binary string, four characters at a time.
    for (i in binary.indices step 4) {
        // Extracting a quartet of binary digits, like gathering a bouquet of flowers.
        val binaryQuartet = binary.substring(i, i + 4)

        // Consulting the spellbook to find the corresponding hexadecimal character.
        val hexChar = binaryToHexMap[binaryQuartet] ?: error("Invalid binary quartet: $binaryQuartet")

        // Adding the hexadecimal character to the treasure chest.
        hexResult += hexChar
    }

    // Returning the filled treasure chest, now brimming with hexadecimal riches.
    return hexResult
}

