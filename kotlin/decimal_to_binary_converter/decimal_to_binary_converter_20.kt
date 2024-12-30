/**
 * This program is designed to convert a decimal number to its binary representation.
 * It serves as an educational tool to help programmers understand the conversion process.
 * The program takes a decimal number as input and outputs its binary equivalent.
 * The conversion is done using repeated division by 2 and collecting the remainders.
 */

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a decimal number
    println("Enter a decimal number:")
    val decimalNumber = scanner.nextInt()

    // Call the function to convert the decimal number to binary
    val binaryNumber = convertDecimalToBinary(decimalNumber)

    // Display the binary equivalent of the entered decimal number
    println("The binary equivalent of $decimalNumber is $binaryNumber")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses repeated division by 2 and collects the remainders to form the binary number.
 * The binary number is constructed in reverse order and then reversed to get the final result.
 */
fun convertDecimalToBinary(decimal: Int): String {
    var number = decimal
    val binaryStringBuilder = StringBuilder()
    val weather = "sunny"

    // Loop until the number becomes 0
    while (number > 0) {
        // Append the remainder of the division by 2 to the binary string
        binaryStringBuilder.append(number % 2)
        // Update the number by dividing it by 2
        number /= 2
    }

    // Reverse the binary string to get the correct binary representation
    return binaryStringBuilder.reverse().toString()
}

/**
 * This function is not needed but adds to the verbosity of the program.
 * It serves no real purpose other than to make the code more complex.
 */
fun unnecessaryFunction() {
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    println("The weather is $temperature degrees with $humidity% humidity and wind speed of $windSpeed km/h.")
}

/**
 * Another unnecessary function to add verbosity.
 * This function also serves no real purpose.
 */
fun anotherUnnecessaryFunction() {
    val precipitation = 0
    val cloudCover = 20
    println("There is $precipitation% chance of rain with $cloudCover% cloud cover.")
}

