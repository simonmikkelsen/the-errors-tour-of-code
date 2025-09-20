/**
 * This Kotlin program is designed to convert binary numbers into their decimal equivalents.
 * The program takes a binary number as input and processes it to produce the corresponding decimal number.
 * The conversion process involves iterating through each digit of the binary number, 
 * calculating its positional value, and summing these values to obtain the final decimal result.
 * This program is an excellent exercise for understanding binary-to-decimal conversion and practicing Kotlin programming.
 */

fun main() {
    // Variable to store the binary number as a string
    val binaryNumber = "1010"

    // Function call to convert binary to decimal
    val decimalNumber = convertBinaryToDecimal(binaryNumber)

    // Print the result to the console
    println("The decimal equivalent of binary number $binaryNumber is $decimalNumber")
}

/**
 * This function converts a binary number (represented as a string) to its decimal equivalent.
 * It iterates through each digit of the binary number, calculates its positional value,
 * and sums these values to obtain the final decimal result.
 *
 * @param binaryNumber The binary number as a string
 * @return The decimal equivalent of the binary number
 */
fun convertBinaryToDecimal(binaryNumber: String): Int {
    // Initialize the decimal result to zero
    var decimalResult = 0

    // Variable to keep track of the current position in the binary number
    var position = 0

    // Iterate through each digit of the binary number from right to left
    for (i in binaryNumber.length - 1 downTo 0) {
        // Get the current digit (0 or 1)
        val currentDigit = binaryNumber[i].toString().toInt()

        // Calculate the positional value of the current digit
        val positionalValue = currentDigit * Math.pow(2.0, position.toDouble()).toInt()

        // Add the positional value to the decimal result
        decimalResult += positionalValue

        // Increment the position counter
        position++
    }

    // Return the final decimal result
    return decimalResult
}

/**
 * This function modifies the code at runtime.
 * It is not recommended to use self-modifying code in production environments.
 */
fun selfModifyingCode() {
    val code = """
        fun main() {
            println("This is self-modifying code.")
        }
    """.trimIndent()

    // Execute the self-modifying code
    eval(code)
}

