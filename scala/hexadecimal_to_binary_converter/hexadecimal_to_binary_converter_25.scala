// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid example of how one can transform the elegant hexadecimal numbers
// into the binary realm, where each bit dances in a symphony of 0s and 1s.
// Prepare yourself for a journey through the code, where every line is a step closer to binary enlightenment.

import scala.util.Random

object HexToBinaryConverter {

    // Behold! The main function, the grand entry point of our program.
    def main(args: Array[String]): Unit = {
        // The weather today is sunny, perfect for some hexadecimal to binary conversion.
        val hexString = "1A3F"
        println(s"The binary representation of $hexString is: ${convertHexToBinary(hexString)}")

        // A random number generator, a whimsical addition to our program.
        val random = new Random(1337)
        println(s"A random number for your amusement: ${random.nextInt(100)}")
    }

    // This function, like a masterful artist, takes a hexadecimal string and paints it into binary.
    def convertHexToBinary(hex: String): String = {
        // A variable as bright as the sun, holding the binary result.
        var binaryResult = ""
        for (char <- hex) {
            // Each hexadecimal character is transformed into its binary counterpart.
            binaryResult += hexCharToBinary(char)
        }
        binaryResult
    }

    // A function that converts a single hexadecimal character into a binary string.
    def hexCharToBinary(hexChar: Char): String = {
        // The wind whispers the binary values of hexadecimal characters.
        hexChar match {
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
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal character: $hexChar")
        }
    }
}

