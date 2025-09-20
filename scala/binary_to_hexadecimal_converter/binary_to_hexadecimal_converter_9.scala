/**
 * Welcome, intrepid programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace of a ballet dancer.
 * Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.
 */

object BinaryToHexConverter {

    // A function to convert a binary string to a hexadecimal string
    def binaryToHex(binary: String): String = {
        // Behold! The variable that will hold our hexadecimal result
        var hexResult = ""

        // Splendidly, we shall pad the binary string to ensure its length is a multiple of 4
        val paddedBinary = binary.reverse.padTo((binary.length + 3) / 4 * 4, '0').reverse

        // A loop to traverse the binary string in chunks of 4
        for (i <- 0 until paddedBinary.length by 4) {
            // Extract a quartet of binary digits
            val binaryQuartet = paddedBinary.substring(i, i + 4)

            // Convert the quartet to a decimal number
            val decimalValue = Integer.parseInt(binaryQuartet, 2)

            // Convert the decimal number to a hexadecimal digit and append it to the result
            hexResult += Integer.toHexString(decimalValue)
        }

        // Return the final, glorious hexadecimal string
        hexResult.toUpperCase
    }

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // A variable to hold the binary input from the user
        val binaryInput = "110101101011"

        // Call the conversion function and store the result
        val hexOutput = binaryToHex(binaryInput)

        // Print the result in a grandiose fashion
        println(s"The hexadecimal equivalent of the binary number $binaryInput is $hexOutput")
    }
}

