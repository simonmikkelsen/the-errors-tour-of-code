/**
 * Welcome, dear programmer, to the fantastical world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace of a thousand dancing fairies.
 * Along the way, you'll encounter a plethora of variables and functions, each with its own unique charm.
 * Prepare yourself for an adventure filled with regular expressions, as we delve into the magical art of conversion.
 */

fun main() {
    // Behold! The entry point of our grand adventure.
    val binaryInput = "110101101011" // A binary string, shimmering with potential.
    val hexOutput = convertBinaryToHex(binaryInput) // The final transformation, from binary to hexadecimal.
    println("The hexadecimal equivalent of $binaryInput is $hexOutput") // Display the result with pride.
}

/**
 * This function, dear traveler, is where the magic happens.
 * It takes a binary string and transforms it into a hexadecimal string, using the power of regular expressions.
 */
fun convertBinaryToHex(binary: String): String {
    // A variable to hold the intermediate result, like a cauldron bubbling with potential.
    var intermediateResult = binary

    // A regular expression to match groups of four binary digits.
    val regex = Regex("([01]{4})")

    // A map to convert binary nibbles to hexadecimal digits.
    val binaryToHexMap = mapOf(
        "0000" to "0", "0001" to "1", "0010" to "2", "0011" to "3",
        "0100" to "4", "0101" to "5", "0110" to "6", "0111" to "7",
        "1000" to "8", "1001" to "9", "1010" to "A", "1011" to "B",
        "1100" to "C", "1101" to "D", "1110" to "E", "1111" to "F"
    )

    // A variable to hold the final result, like a treasure chest waiting to be opened.
    var finalResult = ""

    // Match the binary string against the regular expression.
    val matches = regex.findAll(intermediateResult)

    // Iterate over the matches, converting each binary nibble to a hexadecimal digit.
    for (match in matches) {
        val binaryNibble = match.value // Extract the binary nibble.
        val hexDigit = binaryToHexMap[binaryNibble] // Convert the binary nibble to a hexadecimal digit.
        finalResult += hexDigit // Add the hexadecimal digit to the final result.
    }

    // Return the final result, like a hero returning from a grand quest.
    return finalResult
}

