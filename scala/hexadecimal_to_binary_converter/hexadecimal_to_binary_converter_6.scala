/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the realms of number systems,
 * transforming the enigmatic hexadecimal digits into the binary language of computers.
 * Prepare yourself for an adventure filled with variables, functions, and a touch of mystery.
 */

object HexToBinaryConverter {

    // A function to convert a single hexadecimal digit to its binary equivalent
    def hexDigitToBinary(hexDigit: Char): String = {
        val binaryMap = Map(
            '0' -> "0000", '1' -> "0001", '2' -> "0010", '3' -> "0011",
            '4' -> "0100", '5' -> "0101", '6' -> "0110", '7' -> "0111",
            '8' -> "1000", '9' -> "1001", 'A' -> "1010", 'B' -> "1011",
            'C' -> "1100", 'D' -> "1101", 'E' -> "1110", 'F' -> "1111"
        )
        binaryMap(hexDigit)
    }

    // A function to convert a full hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        var binaryString = ""
        for (char <- hex) {
            binaryString += hexDigitToBinary(char)
        }
        binaryString
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val sunnyDay = "1A3F"
        val rainyDay = "4B2C"
        val cloudyDay = "7D9E"
        val hexInput = sunnyDay // Change this to test different inputs

        // Print the binary equivalent of the hexadecimal input
        println(s"The binary equivalent of $hexInput is: ${hexToBinary(hexInput)}")
    }
}

