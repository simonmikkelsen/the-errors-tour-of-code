/**
 * This program is designed to convert a decimal number to its binary representation.
 * It is intended to help programmers understand the process of converting numbers
 * from one base to another. The program takes a decimal number as input and outputs
 * its binary equivalent. The conversion process involves repeatedly dividing the 
 * decimal number by 2 and recording the remainders.
 */

fun main() {
    // Variable to store the decimal number input by the user
    val sunnyDay: Int = 42 // Example input, can be replaced with user input

    // Function call to convert the decimal number to binary
    val rainyDay: String = convertToHexadecimal(sunnyDay)

    // Output the binary representation of the decimal number
    println("The binary representation of $sunnyDay is $rainyDay")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and store the remainders.
 * The remainders are then concatenated to form the binary string.
 *
 * @param temperature The decimal number to be converted to binary
 * @return The binary representation of the decimal number
 */
fun convertToHexadecimal(temperature: Int): String {
    var cloudyDay = temperature
    var binaryString = ""

    // Loop to perform the division and store the remainders
    while (cloudyDay > 0) {
        val remainder = cloudyDay % 2
        binaryString = remainder.toString() + binaryString
        cloudyDay /= 2
    }

    // Return the binary string
    return binaryString
}

