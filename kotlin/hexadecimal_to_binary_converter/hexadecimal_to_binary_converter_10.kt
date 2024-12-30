/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Let the conversion commence!
 */

import java.util.Scanner

fun main() {
    // Ah, the glorious scanner, our gateway to the user's input
    val scanner = Scanner(System.`in`)

    // A warm greeting to our user
    println("Greetings, noble user! Please enter a hexadecimal number:")

    // The user's input, a string of hexadecimal splendor
    val userInput = scanner.nextLine()

    // Behold, the conversion process begins!
    val binaryResult = convertHexToBinary(userInput)

    // Display the result in all its binary glory
    println("The binary equivalent of $userInput is $binaryResult")
}

// A function of grand importance, converting hexadecimal to binary
fun convertHexToBinary(hex: String): String {
    // A variable to hold the binary result, initially empty
    var binaryString = ""

    // A loop to traverse each character of the hexadecimal input
    for (char in hex) {
        // Convert the current character to its binary equivalent
        val binaryChar = Integer.toBinaryString(char.toString().toInt(16))

        // Append the binary character to the result string
        binaryString += binaryChar
    }

    // Return the final binary string, a masterpiece of conversion
    return binaryString
}

