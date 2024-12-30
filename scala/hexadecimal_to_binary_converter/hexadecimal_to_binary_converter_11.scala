/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with regular expressions, verbose comments, and a touch of the unexpected.
 */

object HexToBinaryConverter {

    // A function that converts a single hexadecimal digit to its binary equivalent
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
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal digit: $hexDigit")
        }
        binaryString
    }

    // A function that converts a hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        val regex = "[0-9A-Fa-f]+".r
        val binaryRain = new StringBuilder

        if (regex.matches(hex)) {
            for (char <- hex) {
                binaryRain.append(hexDigitToBinary(char))
            }
        } else {
            throw new IllegalArgumentException(s"Invalid hexadecimal string: $hex")
        }

        binaryRain.toString()
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val sunnyDay = "1A3F"
        val binarySunshine = hexToBinary(sunnyDay)
        println(s"The binary equivalent of $sunnyDay is $binarySunshine")
    }
}

