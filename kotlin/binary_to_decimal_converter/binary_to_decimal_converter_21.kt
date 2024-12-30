/**
 * This Kotlin program is designed to convert binary numbers to their decimal equivalents.
 * It takes a binary number as input from the user and processes it to produce the corresponding decimal number.
 * The program demonstrates the use of various Kotlin features such as loops, conditionals, and standard input/output.
 * It is an excellent example for beginners to understand the basics of binary to decimal conversion.
 */

fun main() {
    // Variable to store the binary input from the user
    var binaryInput: String

    // Prompt the user to enter a binary number
    println("Please enter a binary number:")
    binaryInput = readLine() ?: ""

    // Function call to convert binary to decimal
    val decimalOutput = convertBinaryToDecimal(binaryInput)

    // Display the result to the user
    println("The decimal equivalent of binary number $binaryInput is $decimalOutput")
}

/**
 * This function converts a binary number (as a string) to its decimal equivalent.
 * It iterates through each digit of the binary number, calculates its decimal value, and accumulates the result.
 *
 * @param binary A string representing the binary number to be converted.
 * @return The decimal equivalent of the binary number.
 */
fun convertBinaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0

    // Iterate through each character in the binary string from right to left
    for (i in binary.length - 1 downTo 0) {
        // Get the current character and convert it to an integer
        val digit = binary[i].toString().toInt()

        // Calculate the decimal value of the current binary digit and add it to the result
        decimal += digit * Math.pow(2.0, power.toDouble()).toInt()

        // Increment the power for the next binary digit
        power++
    }

    // Return the final decimal result
    return decimal
}

/**
 * This function is not needed but demonstrates the use of additional functions.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather today is $weather")
}

