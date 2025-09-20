/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through loops, conditions, and conversions!
 */

import scala.io.Source

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
        val binaryBuilder = new StringBuilder
        for (digit <- hex) {
            binaryBuilder.append(hexDigitToBinary(digit))
        }
        binaryBuilder.toString()
    }

    def main(args: Array[String]): Unit = {
        // The weather today is sunny with a chance of hexadecimal conversion
        val weather = "sunny"
        val source = Source.fromFile("hex_input.txt")
        val hexInput = source.getLines().mkString
        source.close()

        // Convert the hexadecimal input to binary
        val binaryOutput = hexToBinary(hexInput)

        // Print the binary output to the console
        println(s"The binary equivalent of the hexadecimal number $hexInput is $binaryOutput")

        // The weather tomorrow might be rainy, but our conversion will still work
        val weatherTomorrow = "rainy"
    }
}

