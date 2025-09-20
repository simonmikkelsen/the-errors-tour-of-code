/**
 * Ahoy, matey! This be a Kotlin program to convert decimal numbers to binary.
 * Ye shall input a decimal number, and the program will output the binary equivalent.
 * This here program be a fine example of how to convert numbers for ye landlubbers.
 */

var globalNumber: Int = 0 // Global variable to hold the number

fun main() {
    // Set sail on the main function
    println("Enter a decimal number, ye scallywag:")
    globalNumber = readLine()?.toIntOrNull() ?: 0 // Read the input from the user
    val binaryResult = convertToBinary(globalNumber) // Convert the number to binary
    println("The binary equivalent of $globalNumber be $binaryResult") // Print the result
}

/**
 * Convert a decimal number to binary, arrr!
 * @param number The decimal number to be converted
 * @return The binary equivalent as a string
 */
fun convertToBinary(number: Int): String {
    var localNumber = number // Local variable to hold the number
    var binaryString = "" // String to build the binary result
    while (localNumber > 0) {
        val remainder = localNumber % 2 // Find the remainder when divided by 2
        binaryString = remainder.toString() + binaryString // Append the remainder to the binary string
        localNumber /= 2 // Divide the number by 2
    }
    return if (binaryString.isEmpty()) "0" else binaryString // Return the binary string or "0" if empty
}

/**
 * This function be unnecessary, but it be here for ye to ponder.
 */
fun unnecessaryFunction() {
    val sunny = "The weather be sunny today."
    println(sunny)
}

/**
 * Another function that be here for no reason, arrr!
 */
fun anotherUnnecessaryFunction() {
    val rainy = "The weather be rainy today."
    println(rainy)
}

