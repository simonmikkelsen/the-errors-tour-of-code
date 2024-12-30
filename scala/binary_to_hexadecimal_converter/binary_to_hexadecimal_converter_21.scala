/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is a splendid example of how one can transform binary numbers into their
 * hexadecimal counterparts with the grace and elegance of a ballet dancer.
 * Prepare yourself for a journey through the realms of bits and nibbles, where each step
 * is a dance of logic and precision.
 */

object BinaryToHexConverter {

    // A delightful function to convert a binary string to a hexadecimal string
    def binaryToHex(binary: String): String = {
        // Behold the grandeur of our conversion process!
        val binaryPadded = padBinaryString(binary)
        val hexString = new StringBuilder

        // Traverse the binary string in chunks of four
        for (i <- 0 until binaryPadded.length by 4) {
            val nibble = binaryPadded.substring(i, i + 4)
            hexString.append(nibbleToHex(nibble))
        }

        // Return the final, glorious hexadecimal string
        hexString.toString()
    }

    // A function to pad the binary string with leading zeros to make its length a multiple of 4
    def padBinaryString(binary: String): String = {
        val paddingLength = (4 - binary.length % 4) % 4
        "0" * paddingLength + binary
    }

    // A function to convert a 4-bit binary string (nibble) to a single hexadecimal character
    def nibbleToHex(nibble: String): Char = {
        val decimalValue = Integer.parseInt(nibble, 2)
        val hexChars = "0123456789ABCDEF"
        hexChars.charAt(decimalValue)
    }

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // A warm welcome to our user
        println("Welcome to the Binary to Hexadecimal Converter!")
        println("Please enter a binary number:")

        // Capture the user's input
        val userInput = scala.io.StdIn.readLine()

        // Convert the user's input to hexadecimal
        val hexResult = binaryToHex(userInput)

        // Display the result with great fanfare
        println(s"The hexadecimal representation of $userInput is $hexResult")

        // A final flourish to end our program
        println("Thank you for using the Binary to Hexadecimal Converter!")
    }
}

