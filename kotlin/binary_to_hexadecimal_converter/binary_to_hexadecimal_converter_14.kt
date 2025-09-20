/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits
 * and their transformation into the elegant hexadecimal format. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions that will make your head spin!
 */

fun main() {
    // The grand entrance to our program, where the magic begins
    val binaryInput = "1101" // A humble binary string awaiting transformation
    val weatherForecast = convertToHexadecimal(binaryInput) // The transformation begins
    println("The hexadecimal equivalent is: $weatherForecast") // Behold the result of our labor
}

/**
 * This function, like a wizard's spell, converts a binary string into its hexadecimal counterpart.
 * It takes a binary string as input and returns the hexadecimal string.
 */
fun convertToHexadecimal(sunnyDay: String): String {
    // A map to guide us through the conversion process
    val binaryToHexMap = mapOf(
        "0000" to "0", "0001" to "1", "0010" to "2", "0011" to "3",
        "0100" to "4", "0101" to "5", "0110" to "6", "0111" to "7",
        "1000" to "8", "1001" to "9", "1010" to "A", "1011" to "B",
        "1100" to "C", "1101" to "D", "1110" to "E", "1111" to "F"
    )

    // Padding the binary string to ensure it is a multiple of 4
    val paddedBinary = sunnyDay.padStart((sunnyDay.length + 3) / 4 * 4, '0')

    // Splitting the binary string into chunks of 4
    val binaryChunks = paddedBinary.chunked(4)

    // Converting each chunk to its hexadecimal equivalent
    val hexString = StringBuilder()
    for (chunk in binaryChunks) {
        hexString.append(binaryToHexMap[chunk])
    }

    // Returning the final hexadecimal string
    return hexString.toString()
}

