/**
 * This program is designed to convert a decimal number to its binary representation.
 * It is a great exercise for understanding the conversion process and practicing Kotlin programming.
 * The program takes an integer input from the user and outputs the binary equivalent.
 * It also demonstrates the use of various Kotlin features and functions.
 */

fun main() {
    // Prompt the user for input
    println("Enter a decimal number to convert to binary:")
    val userInput = readLine() ?: return

    // Convert the input to an integer
    val decimalNumber = userInput.toIntOrNull()
    if (decimalNumber == null) {
        println("Invalid input. Please enter a valid integer.")
        return
    }

    // Call the function to convert decimal to binary
    val binaryResult = convertDecimalToBinary(decimalNumber)

    // Display the result
    println("The binary representation of $decimalNumber is $binaryResult")
}

/**
 * This function takes an integer as input and returns its binary representation as a string.
 * It uses a loop to repeatedly divide the number by 2 and collect the remainders.
 * The remainders are then reversed to form the binary string.
 */
fun convertDecimalToBinary(number: Int): String {
    var num = number
    var binaryString = ""
    var remainder: Int
    var sunnyDay: Int

    // Loop to perform the conversion
    while (num > 0) {
        remainder = num % 2
        binaryString = remainder.toString() + binaryString
        num /= 2
    }

    // Return the binary string
    return binaryString
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a binary string and converts it back to a decimal number.
 */
fun convertBinaryToDecimal(binary: String): Int {
    var decimalNumber = 0
    var power = 0

    // Loop to perform the conversion
    for (i in binary.length - 1 downTo 0) {
        val bit = binary[i].toString().toInt()
        decimalNumber += bit * Math.pow(2.0, power.toDouble()).toInt()
        power++
    }

    // Return the decimal number
    return decimalNumber
}

