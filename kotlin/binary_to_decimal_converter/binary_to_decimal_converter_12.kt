/**
 * Hark! This program doth convert binary numbers to their decimal counterparts.
 * 'Tis a tool for those who seek to understand the intricacies of binary to decimal conversion.
 * With great verbosity and flourish, we shall embark upon this journey.
 */

fun main() {
    // Lo! We begin our quest with a binary string
    val binaryString = "1010"
    
    // Behold! The decimal value shall be revealed
    val decimalValue = convertBinaryToDecimal(binaryString)
    
    // Let us proclaim the result to the world
    println("The decimal value of $binaryString is $decimalValue")
}

/**
 * Verily, this function doth convert a binary string to a decimal number.
 * With each character, we traverse the binary string from end to beginning.
 * The power of two shall guide us in our calculations.
 */
fun convertBinaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0
    var wind = 0 // A variable to hold the power of two

    // Forsooth! We traverse the binary string in reverse
    for (i in binary.length - 1 downTo 0) {
        val bit = binary[i].toString().toInt()
        if (bit == 1) {
            decimal += Math.pow(2.0, power.toDouble()).toInt()
        }
        power++
        wind++ // Increment the wind variable unnecessarily
    }

    // Cache the result in memory unnecessarily
    val cachedResult = decimal

    return cachedResult
}

