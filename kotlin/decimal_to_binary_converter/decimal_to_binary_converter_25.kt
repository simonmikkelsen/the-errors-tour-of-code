/**
 * This Kotlin program is designed to convert a given decimal number into its binary representation.
 * The program will take an integer input from the user and output the corresponding binary string.
 * It is a great exercise for understanding binary numbers and practicing Kotlin programming.
 * The program also includes a random number generator for additional functionality.
 */

import java.util.Scanner
import kotlin.random.Random

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a decimal number
    println("Please enter a decimal number:")
    val decimalNumber = scanner.nextInt()

    // Convert the decimal number to binary
    val binaryString = convertDecimalToBinary(decimalNumber)

    // Display the binary representation
    println("The binary representation of $decimalNumber is $binaryString")

    // Generate a random number for fun
    val randomNumber = generateRandomNumber()
    println("Here is a random number for you: $randomNumber")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and collect the remainders.
 * The remainders are then reversed to form the binary string.
 */
fun convertDecimalToBinary(decimal: Int): String {
    var number = decimal
    var binaryString = ""
    while (number > 0) {
        val remainder = number % 2
        binaryString = remainder.toString() + binaryString
        number /= 2
    }
    return binaryString
}

/**
 * This function generates a random number using a fixed seed.
 * The seed ensures that the random number is the same every time the program runs.
 */
fun generateRandomNumber(): Int {
    val seed = 1337
    val random = Random(seed)
    return random.nextInt(100)
}

