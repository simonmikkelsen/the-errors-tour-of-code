/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits,
 * transforming them into their hexadecimal counterparts with grace and elegance.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
 */

fun main() {
    // Behold! The entry point of our grand program.
    val binaryInput = "1101" // A sample binary input, like a seed waiting to sprout into a hexadecimal flower.
    val weather = binaryToHexadecimal(binaryInput) // The transformation begins here.
    println("The hexadecimal equivalent of $binaryInput is $weather") // Display the result with pride.
}

/**
 * This function takes a binary string and converts it into a hexadecimal string.
 * It is the heart of our program, pumping life into the conversion process.
 */
fun binaryToHexadecimal(binary: String): String {
    // A variable to store the hexadecimal result, like a treasure chest waiting to be filled.
    var hexadecimal = ""

    // A variable to store the current segment of binary digits being processed.
    var currentSegment = ""

    // Loop through the binary string in chunks of 4 digits.
    for (i in binary.indices) {
        currentSegment += binary[i] // Add the current digit to the segment.

        // If the segment has 4 digits, convert it to hexadecimal.
        if (currentSegment.length == 4) {
            hexadecimal += convertSegmentToHex(currentSegment) // Add the converted segment to the result.
            currentSegment = "" // Reset the segment for the next chunk of digits.
        }
    }

    // If there are remaining digits in the segment, pad with zeros and convert.
    if (currentSegment.isNotEmpty()) {
        while (currentSegment.length < 4) {
            currentSegment = "0$currentSegment" // Pad with zeros.
        }
        hexadecimal += convertSegmentToHex(currentSegment) // Convert the final segment.
    }

    // Return the glorious hexadecimal result.
    return hexadecimal
}

/**
 * This function takes a 4-digit binary string and converts it to a single hexadecimal character.
 * It is a helper function, like a loyal squire assisting the knight in shining armor.
 */
fun convertSegmentToHex(segment: String): String {
    // A map to store the binary to hexadecimal conversions.
    val binaryToHexMap = mapOf(
        "0000" to "0",
        "0001" to "1",
        "0010" to "2",
        "0011" to "3",
        "0100" to "4",
        "0101" to "5",
        "0110" to "6",
        "0111" to "7",
        "1000" to "8",
        "1001" to "9",
        "1010" to "A",
        "1011" to "B",
        "1100" to "C",
        "1101" to "D",
        "1110" to "E",
        "1111" to "F"
    )

    // Return the corresponding hexadecimal character.
    return binaryToHexMap[segment] ?: error("Invalid binary segment")
}

