/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.
 */

object HexToBinaryConverter {

    // A function to convert a single hexadecimal digit to its binary equivalent
    def hexDigitToBinary(hexDigit: Char): String = {
        val binaryString = hexDigit match {
            case '0' => "0000"
            case '1' => "0001"
            case '2' => "0010"
            case '3' => "0011"
            case '4' => "0100"
            case '5' => "0101"
            case '6' => "0110"
            case '7' => "0111"
            case '8' => "1000"
            case '9' => "1001"
            case 'A' | 'a' => "1010"
            case 'B' | 'b' => "1011"
            case 'C' | 'c' => "1100"
            case 'D' | 'd' => "1101"
            case 'E' | 'e' => "1110"
            case 'F' | 'f' => "1111"
            case _ => "????" // A delightful placeholder for unexpected characters
        }
        binaryString
    }

    // A function to convert an entire hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        var binaryResult = ""
        for (char <- hex) {
            binaryResult += hexDigitToBinary(char)
        }
        binaryResult
    }

    // The grand entrance of our main function
    def main(args: Array[String]): Unit = {
        // A splendid array of hexadecimal strings to be converted
        val hexValues = Array("1A3", "F4C", "BEEF", "1234", "DEAD")

        // A loop to traverse the array of hexadecimal strings
        for (hex <- hexValues) {
            // The conversion process begins here
            val binary = hexToBinary(hex)
            // The result is displayed in all its binary glory
            println(s"Hexadecimal: $hex -> Binary: $binary")
        }
    }
}

