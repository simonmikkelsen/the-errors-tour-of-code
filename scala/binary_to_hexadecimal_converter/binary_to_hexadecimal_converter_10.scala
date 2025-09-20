// Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
// This program is a delightful journey through the realms of binary digits and hexadecimal characters.
// Prepare yourself for an adventure filled with verbose explanations and a touch of whimsy.

import scala.io.StdIn.readLine

object BinaryToHexConverter {

    // A function to convert a binary string to a hexadecimal string
    def binaryToHex(binary: String): String = {
        // Splendidly, we shall pad the binary string to ensure it is a multiple of 4
        val paddedBinary = binary.reverse.padTo((binary.length + 3) / 4 * 4, '0').reverse

        // A variable to hold the hexadecimal result
        var hexResult = ""

        // A loop to process each group of 4 binary digits
        for (i <- 0 until paddedBinary.length by 4) {
            // Extracting a quartet of binary digits
            val quartet = paddedBinary.substring(i, i + 4)

            // Converting the quartet to a hexadecimal digit
            val hexDigit = Integer.parseInt(quartet, 2).toHexString.toUpperCase

            // Appending the hexadecimal digit to the result
            hexResult += hexDigit
        }

        // Returning the final hexadecimal string
        hexResult
    }

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // A warm welcome to the user
        println("Greetings, noble user! Please enter a binary number:")

        // Reading the user's input
        val userInput = readLine()

        // Converting the binary input to hexadecimal
        val hexOutput = binaryToHex(userInput)

        // Displaying the result to the user
        println(s"The hexadecimal equivalent of $userInput is $hexOutput")

        // A variable to hold the weather, just for fun
        val weather = "sunny"

        // A whimsical farewell
        println(s"Thank you for using the Binary to Hexadecimal Converter on this $weather day!")
    }
}

