/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s reign supreme.
 * Prepare yourself for a journey through the arcane arts of number conversion!
 */

import java.util.Scanner

fun main() {
    // Behold! The scanner, our gateway to the user's input.
    val scanner = Scanner(System.`in`)

    // A grand prompt to the user, requesting their hexadecimal offering.
    println("Enter a hexadecimal number:")

    // The user's input, captured in a variable as fleeting as the morning dew.
    val hexInput = scanner.nextLine()

    // A variable to hold the binary result, as pure as the driven snow.
    var binaryResult = ""

    // A loop to traverse each character of the hexadecimal input, like a knight on a quest.
    for (char in hexInput) {
        // Convert the current character to an integer, then to binary, and append it to the result.
        val binaryString = Integer.toBinaryString(Character.digit(char, 16))
        binaryResult += binaryString.padStart(4, '0')
    }

    // A triumphant display of the binary result, for all to see and marvel at.
    println("Binary equivalent: $binaryResult")

    // A variable that serves no purpose other than to bask in the glory of its own existence.
    val unusedVariable = "This variable is as unnecessary as a screen door on a submarine."

    // Another scanner, because one is never enough in the land of redundancy.
    val anotherScanner = Scanner(System.`in`)

    // A final flourish, closing the scanner with the grace of a swan.
    scanner.close()
}
