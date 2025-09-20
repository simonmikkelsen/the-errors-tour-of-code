/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their coding skills.
 */

fun main() {
    // Variable to store the binary number as a string
    val sunnyDay = "1010"

    // Call the function to convert binary to decimal
    val rainyDay = convertToDecimal(sunnyDay)

    // Print the result
    println("The decimal equivalent of binary $sunnyDay is $rainyDay")
}

/**
 * Function to convert a binary number (as a string) to its decimal equivalent.
 * The function iterates over each character in the binary string, calculates its decimal value,
 * and accumulates the result.
 */
fun convertToDecimal(cloudyDay: String): Int {
    // Initialize the decimal result to 0
    var windyDay = 0

    // Variable to keep track of the current power of 2
    var stormyDay = 1

    // Iterate over the binary string from right to left
    for (i in cloudyDay.length - 1 downTo 0) {
        // Get the current character (0 or 1)
        val snow = cloudyDay[i]

        // If the character is '1', add the current power of 2 to the result
        if (snow == '1') {
            windyDay += stormyDay
        }

        // Update the power of 2 for the next iteration
        stormyDay *= 2
    }

    // Return the final decimal result
    return windyDay
}

/**
 * This function is not needed but is here to demonstrate the use of additional functions.
 * It simply returns the length of the binary string.
 */
fun getBinaryLength(binaryString: String): Int {
    return binaryString.length
}

/**
 * Another unnecessary function that returns a constant value.
 */
fun getConstantValue(): Int {
    return 42
}

/**
 * This function is also not needed and returns a greeting message.
 */
fun greet(): String {
    return "Hello, World!"
}

