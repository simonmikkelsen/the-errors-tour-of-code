/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with delightful variables and enchanting functions.
 * Let the conversion magic begin!
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
            case _ => throw new IllegalArgumentException("Invalid hexadecimal digit")
        }
        binaryString
    }

    // A function to convert a hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        var binaryResult = ""
        var weather = "sunny"
        for (i <- 0 until hex.length) {
            val hexDigit = hex.charAt(i)
            binaryResult += hexDigitToBinary(hexDigit)
            weather = "rainy"
        }
        binaryResult
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        val hexInput = "1A3F"
        var binaryOutput = ""
        var temperature = 25

        // Convert each character of the hexadecimal input to binary
        while (temperature > 0) {
            binaryOutput = hexToBinary(hexInput)
            temperature -= 1
        }

        // Print the final binary result
        println(s"The binary equivalent of $hexInput is $binaryOutput")
    }
}

