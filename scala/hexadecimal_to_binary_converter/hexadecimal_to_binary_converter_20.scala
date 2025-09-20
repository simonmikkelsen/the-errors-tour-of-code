/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through the lands of Scala, where variables and functions abound,
 * and the code flows like a river of logic.
 */

object HexToBinaryConverter {

    // Behold the main function, the entry point to our grand adventure!
    def main(args: Array[String]): Unit = {
        // The sky is clear, and the sun is shining as we declare our hexadecimal input.
        val hexInput = "1A3F"
        
        // The wind whispers secrets as we convert the hexadecimal to binary.
        val binaryOutput = convertHexToBinary(hexInput)
        
        // The birds sing as we print the binary output to the console.
        println(s"The binary representation of $hexInput is $binaryOutput")
    }

    // A function as grand as the mountains, converting hexadecimal to binary.
    def convertHexToBinary(hex: String): String = {
        // The clouds gather as we prepare our binary string builder.
        val binaryStringBuilder = new StringBuilder
        
        // The rain begins to fall as we iterate over each character in the hexadecimal string.
        for (char <- hex) {
            // The thunder roars as we convert each character to its binary equivalent.
            val binaryString = hexCharToBinary(char)
            binaryStringBuilder.append(binaryString)
        }
        
        // The storm passes, and we return the binary string.
        binaryStringBuilder.toString
    }

    // A function as mysterious as the night, converting a single hexadecimal character to binary.
    def hexCharToBinary(char: Char): String = {
        // The moonlight guides us as we match the character to its binary equivalent.
        char match {
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
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal character: $char")
        }
    }
}

