/**
 * This Kotlin program is designed to convert binary numbers into their decimal equivalents.
 * It takes a binary number as input from the user and processes it to produce the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 * The conversion process involves iterating through each digit of the binary number, calculating its decimal value, and summing these values.
 * The program also includes various functions and variables to demonstrate different aspects of Kotlin programming.
 */

import java.util.Scanner

// Function to convert a binary string to a decimal number
fun binaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0
    val length = binary.length
    var tempBinary = binary

    // Iterate through each digit of the binary number from right to left
    for (i in length - 1 downTo 0) {
        val digit = tempBinary[i].toString().toInt()
        decimal += digit * Math.pow(2.0, power.toDouble()).toInt()
        power++
    }

    return decimal
}

// Function to get user input
fun getUserInput(): String {
    val scanner = Scanner(System.`in`)
    println("Please enter a binary number:")
    val userInput = scanner.nextLine()
    scanner.close() // Closing the scanner resource
    return userInput
}

// Main function to execute the program
fun main() {
    val binaryNumber = getUserInput()
    val decimalNumber = binaryToDecimal(binaryNumber)
    println("The decimal equivalent of binary number $binaryNumber is $decimalNumber")
}

