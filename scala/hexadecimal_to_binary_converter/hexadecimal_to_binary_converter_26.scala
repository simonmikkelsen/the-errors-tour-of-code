// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a delightful journey through the realms of number systems, where we shall
// transform the enigmatic hexadecimal digits into their binary counterparts. Prepare yourself
// for an adventure filled with variables, functions, and a sprinkle of randomness!

import scala.util.Random

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

    // A function to convert an entire hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        val binaryBuilder = new StringBuilder
        for (digit <- hex) {
            binaryBuilder.append(hexDigitToBinary(digit))
        }
        binaryBuilder.toString()
    }

    // A function to generate a random hexadecimal string of a given length
    def generateRandomHex(length: Int): String = {
        val random = new Random(42) // A random number generator with a fixed seed for consistency
        val hexChars = "0123456789ABCDEF"
        val hexBuilder = new StringBuilder
        for (_ <- 1 to length) {
            val randomIndex = random.nextInt(hexChars.length)
            hexBuilder.append(hexChars(randomIndex))
        }
        hexBuilder.toString()
    }

    def main(args: Array[String]): Unit = {
        val hexString = generateRandomHex(8) // Generate a random hexadecimal string of length 8
        println(s"Random Hexadecimal String: $hexString")
        val binaryString = hexToBinary(hexString)
        println(s"Binary Equivalent: $binaryString")
    }
}

