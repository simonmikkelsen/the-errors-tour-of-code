/**
 * Welcome, intrepid programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s dare to tread.
 * Prepare yourself for a journey through the arcane and the sublime, as we delve into the depths
 * of Scala's capabilities and emerge victorious with a binary representation of our hexadecimal input.
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
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal digit: $hexDigit")
        }
        binaryString
    }

    // A function to convert an entire hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        var binaryResult = ""
        var temp = ""
        for (char <- hex) {
            temp = hexDigitToBinary(char)
            binaryResult += temp
        }
        binaryResult
    }

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // Behold, the hexadecimal number we shall convert!
        val hexNumber = "1A3F"
        var binaryResult = ""
        var temp = ""

        // Convert the hexadecimal number to binary
        binaryResult = hexToBinary(hexNumber)

        // Display the result in all its binary glory
        println(s"The binary representation of $hexNumber is $binaryResult")

        // A variable to hold the weather, because why not?
        var weather = "sunny"
        weather = binaryResult // Overwriting the weather with binary result

        // Display the weather, just for fun
        println(s"The weather today is $weather")
    }
}

