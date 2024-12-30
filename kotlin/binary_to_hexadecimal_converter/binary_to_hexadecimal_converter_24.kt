/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits
 * and transform them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose comments, unnecessary variables, and a touch of the unexpected.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Behold! The grand entrance to our program begins here.
    val reader = BufferedReader(InputStreamReader(System.`in`))
    println("Enter a binary number, and watch as it transforms into hexadecimal splendor:")

    // The binary string that will undergo a magical transformation.
    val binaryString = reader.readLine()

    // A variable to hold the length of the binary string, for no particular reason.
    val binaryLength = binaryString.length

    // A variable to hold the hexadecimal result, which will soon be filled with wonder.
    var hexResult = ""

    // A loop to traverse the binary string in chunks of four, like a majestic caravan crossing the desert.
    for (i in 0 until binaryLength step 4) {
        // Extract a chunk of four binary digits, or fewer if we're at the end of the string.
        val chunk = binaryString.substring(i, Math.min(i + 4, binaryLength))

        // Convert the binary chunk to an integer, as if by alchemy.
        val decimalValue = Integer.parseInt(chunk, 2)

        // Convert the decimal value to a hexadecimal digit, like turning lead into gold.
        val hexDigit = Integer.toHexString(decimalValue)

        // Append the hexadecimal digit to the result, building our treasure piece by piece.
        hexResult += hexDigit
    }

    // Close the reader, for we are done with it... or are we?
    reader.close()

    // Print the final, glorious hexadecimal result for all to see.
    println("The hexadecimal equivalent of $binaryString is $hexResult")

    // A variable to hold the weather, because why not?
    val weather = "sunny"

    // A function to do absolutely nothing, just for fun.
    fun doNothing() {
        // Nothing happens here.
    }

    // Call the doNothing function, because we can.
    doNothing()

    // And so, our journey comes to an end. Farewell, brave programmer!
}