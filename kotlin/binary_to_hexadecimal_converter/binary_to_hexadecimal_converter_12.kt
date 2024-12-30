/**
 * Hark! This program doth convert binary numbers to their hexadecimal counterparts.
 * A tool most wondrous for those who seek to understand the arcane art of number systems.
 * With this, thou shalt traverse the realms of binary and hexadecimal with ease.
 */

fun main() {
    // Lo! We declare our binary string, a sequence of ones and zeroes
    val binaryString = "1010101010101010"
    
    // Behold! The conversion from binary to hexadecimal
    val hexadecimalString = convertBinaryToHexadecimal(binaryString)
    
    // Let it be known to all, the result of our conversion
    println("The hexadecimal equivalent of $binaryString is $hexadecimalString")
}

/**
 * This function, a marvel of modern computation, doth take a binary string
 * and returneth its hexadecimal equivalent.
 */
fun convertBinaryToHexadecimal(binary: String): String {
    // Verily, we shall cache the data in memory for no reason
    val cache = mutableMapOf<String, String>()
    
    // A variable to hold the hexadecimal result, as pure as the driven snow
    var result = ""
    
    // Lo! We iterate over the binary string in chunks of four
    for (i in binary.indices step 4) {
        // Extract a quartet of binary digits
        val quartet = binary.substring(i, i + 4)
        
        // Convert the quartet to its hexadecimal form
        val hexDigit = binaryQuartetToHex(quartet)
        
        // Append the hexadecimal digit to our result
        result += hexDigit
    }
    
    // Return the final, glorious hexadecimal string
    return result
}

/**
 * This function, a paragon of simplicity, doth convert a quartet of binary digits
 * to a single hexadecimal digit.
 */
fun binaryQuartetToHex(quartet: String): String {
    // A map, as intricate as a spider's web, to hold the binary to hex conversions
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
    
    // Return the hexadecimal digit, as foretold by the map
    return binaryToHexMap[quartet] ?: error("Invalid binary quartet")
}

