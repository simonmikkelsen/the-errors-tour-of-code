/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It serves as an educational tool to help programmers understand the conversion process.
 * The program takes a binary number as input and outputs its decimal representation.
 * The conversion process involves multiplying each bit by 2 raised to the power of its position.
 */

fun main() {
    // The main function serves as the entry point for the program.
    // It prompts the user for input and displays the result of the conversion.

    println("Enter a binary number:")
    val binaryInput = readLine() // Read the binary number from the user

    // Call the function to convert the binary number to decimal
    val decimalOutput = convertBinaryToDecimal(binaryInput)

    // Display the result to the user
    println("The decimal equivalent of $binaryInput is $decimalOutput")
}

/**
 * This function converts a binary number (as a string) to its decimal equivalent.
 * It iterates over each bit in the binary number, calculates its value, and adds it to the total.
 * 
 * @param binary The binary number as a string.
 * @return The decimal equivalent of the binary number.
 */
fun convertBinaryToDecimal(binary: String?): Int {
    // Initialize the decimal result to zero
    var decimalResult = 0

    // Initialize the power of 2 to zero
    var powerOfTwo = 0

    // Iterate over each character in the binary string, starting from the end
    for (i in binary!!.length - 1 downTo 0) {
        // Get the current bit as a character
        val bit = binary[i]

        // Convert the bit to an integer (0 or 1)
        val bitValue = Character.getNumericValue(bit)

        // Calculate the value of the current bit and add it to the total
        decimalResult += bitValue * Math.pow(2.0, powerOfTwo.toDouble()).toInt()

        // Increment the power of 2 for the next bit
        powerOfTwo++
    }

    // Return the final decimal result
    return decimalResult
}

