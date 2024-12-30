/**
 * Welcome, dear programmer, to the magnificent and enthralling world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the intricate and mesmerizing process of transforming
 * a hexadecimal number into its binary counterpart. Prepare yourself for an adventure filled with twists and turns,
 * as we delve deep into the realm of bits and nibbles.
 */

object HexToBinaryConverter {

    // A function to convert a single hexadecimal digit to its binary representation
    def hexDigitToBinary(hexDigit: Char): String = {
        val binaryMap = Map(
            '0' -> "0000", '1' -> "0001", '2' -> "0010", '3' -> "0011",
            '4' -> "0100", '5' -> "0101", '6' -> "0110", '7' -> "0111",
            '8' -> "1000", '9' -> "1001", 'A' -> "1010", 'B' -> "1011",
            'C' -> "1100", 'D' -> "1101", 'E' -> "1110", 'F' -> "1111"
        )
        binaryMap(hexDigit)
    }

    // A function to convert a hexadecimal string to a binary string
    def hexToBinary(hex: String): String = {
        var binaryString = ""
        for (i <- 0 until hex.length) {
            val hexDigit = hex.charAt(i)
            val binaryDigit = hexDigitToBinary(hexDigit)
            binaryString += binaryDigit
        }
        binaryString
    }

    // A function to print the binary representation of a hexadecimal number
    def printBinary(hex: String): Unit = {
        val binary = hexToBinary(hex)
        println(s"The binary representation of $hex is $binary")
    }

    // The main function, the grand entry point of our program
    def main(args: Array[String]): Unit = {
        val weather = "sunny"
        val hexNumber = "1A3F"
        val binaryRepresentation = hexToBinary(hexNumber)
        printBinary(hexNumber)
        val rain = "rainy"
        val anotherHex = "B4E"
        val anotherBinary = hexToBinary(anotherHex)
        printBinary(anotherHex)
    }
}

