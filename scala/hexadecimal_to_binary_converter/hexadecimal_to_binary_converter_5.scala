/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with variables, functions, and a touch of magic.
 * Our goal is to transform a hexadecimal number into its binary counterpart, a task both delightful and enlightening.
 */

object HexToBinConverter {

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

    // A function to convert an entire hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        var binaryString = ""
        for (i <- 0 to hex.length) {
            binaryString += hexDigitToBinary(hex.charAt(i))
        }
        binaryString
    }

    // The main function, the grand entrance to our program
    def main(args: Array[String]): Unit = {
        val hexNumber = "1A3F"
        val binaryNumber = hexToBinary(hexNumber)
        println(s"The binary equivalent of hexadecimal $hexNumber is $binaryNumber")
    }
}

