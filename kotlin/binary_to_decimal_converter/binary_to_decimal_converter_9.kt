/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It takes a binary string as input and processes each bit to calculate the decimal value.
 * The program demonstrates the use of loops, conditionals, and basic arithmetic operations.
 * It is a great example for beginners to understand how binary to decimal conversion works.
 */

fun main() {
    // The binary string to be converted
    val binaryString = "1010"

    // Initialize the decimal value to zero
    var decimalValue = 0

    // The length of the binary string
    val length = binaryString.length

    // Loop through each character in the binary string
    for (i in 0 until length) {
        // Get the character at the current position
        val char = binaryString[length - i - 1]

        // Convert the character to an integer (0 or 1)
        val bit = Character.getNumericValue(char)

        // Calculate the value of the current bit and add it to the decimal value
        decimalValue += bit * Math.pow(2.0, i.toDouble()).toInt()
    }

    // Print the final decimal value
    println("The decimal value of $binaryString is $decimalValue")
}

/**
 */