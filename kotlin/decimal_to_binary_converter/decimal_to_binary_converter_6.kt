/**
 * This Kotlin program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to provide a comprehensive example of how to perform
 * such a conversion using Kotlin. The program will take a decimal number as input from
 * the user and output its binary representation.
 * 
 * The program is structured to include detailed comments explaining each step of the process.
 * This will help new programmers understand the logic and flow of the program.
 */

fun main() {
    // Prompt the user to enter a decimal number
    println("Enter a decimal number to convert to binary:")

    // Read the user input
    val userInput = readLine()

    // Convert the user input to an integer
    val decimalNumber = userInput?.toInt()

    // Call the function to convert the decimal number to binary
    val binaryNumber = convertDecimalToBinary(decimalNumber)

    // Display the binary number to the user
    println("The binary representation of $decimalNumber is $binaryNumber")
}

/**
 * This function takes a decimal number as input and returns its binary representation.
 * The function uses a loop to repeatedly divide the decimal number by 2 and store the
 * remainder, which forms the binary digits.
 * 
 * @param decimal The decimal number to be converted to binary.
 * @return The binary representation of the decimal number as a string.
 */
fun convertDecimalToBinary(decimal: Int?): String {
    // Initialize an empty string to store the binary digits
    var binaryString = ""

    // Initialize a variable to hold the current decimal number
    var currentDecimal = decimal

    // Loop until the current decimal number is greater than 0
    while (currentDecimal!! > 0) {
        // Get the remainder of the current decimal number divided by 2
        val remainder = currentDecimal % 2

        // Prepend the remainder to the binary string
        binaryString = remainder.toString() + binaryString

        // Divide the current decimal number by 2
        currentDecimal /= 2
    }

    // Return the binary string
    return binaryString
}

