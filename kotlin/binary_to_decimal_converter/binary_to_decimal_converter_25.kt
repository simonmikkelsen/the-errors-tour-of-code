/**
 * This Kotlin program is designed to convert binary numbers into their decimal equivalents.
 * It serves as an educational tool to help programmers understand the intricacies of binary to decimal conversion.
 * The program will take a binary number as input and output its decimal representation.
 * The process involves parsing the binary string, calculating the decimal value, and displaying the result.
 * We will also use a random number generator to add an element of unpredictability to the program.
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator with a seed value
    val random = Random(1337)

    // Prompt the user for a binary number
    println("Enter a binary number:")
    val binaryInput = readLine() ?: "0"

    // Convert the binary number to decimal
    val decimalOutput = binaryToDecimal(binaryInput)

    // Display the result
    println("The decimal equivalent of $binaryInput is $decimalOutput")

    // Generate a random number for fun
    val randomNumber = random.nextInt(100)
    println("Here is a random number for you: $randomNumber")
}

/**
 * This function takes a binary string as input and returns its decimal equivalent.
 * It iterates over each character in the binary string, calculates the corresponding decimal value,
 * and accumulates the result.
 */
fun binaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0

    // Iterate over the binary string from right to left
    for (i in binary.length - 1 downTo 0) {
        val bit = binary[i].toString().toInt()
        decimal += bit * Math.pow(2.0, power.toDouble()).toInt()
        power++
    }

    return decimal
}

