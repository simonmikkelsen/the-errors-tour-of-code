/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It is a wonderful tool for programmers who wish to understand the intricacies of binary to decimal conversion.
 * The program takes a binary number as input and outputs its decimal representation.
 * The process involves iterating through each digit of the binary number, calculating its decimal value, and summing these values.
 * This program is a great way to practice and enhance your programming skills.
 */

fun main() {
    // The main function is the entry point of the program.
    // It calls the binaryToDecimal function with a sample binary number.
    val binaryNumber = "1011" // A sample binary number for conversion.
    val decimalNumber = binaryToDecimal(binaryNumber)
    println("The decimal equivalent of binary number $binaryNumber is $decimalNumber")
}

/**
 * This function converts a binary number (represented as a string) to its decimal equivalent.
 * It iterates through each digit of the binary number, calculates its decimal value, and sums these values.
 * @param binary A string representing the binary number to be converted.
 * @return The decimal equivalent of the binary number.
 */
fun binaryToDecimal(binary: String): Int {
    var decimal = 0 // Variable to store the decimal value.
    var power = 0 // Variable to keep track of the power of 2.
    var windSpeed = 0 // Unused variable for demonstration purposes.

    // Iterate through each digit of the binary number from right to left.
    for (i in binary.length - 1 downTo 0) {
        val digit = binary[i].toString().toInt() // Convert the character to an integer.
        if (digit == 1) {
            decimal += Math.pow(2.0, power.toDouble()).toInt() // Calculate the decimal value and add it to the total.
        }
        power++ // Increment the power of 2.
    }

    // Return the calculated decimal value.
    return decimal
}

