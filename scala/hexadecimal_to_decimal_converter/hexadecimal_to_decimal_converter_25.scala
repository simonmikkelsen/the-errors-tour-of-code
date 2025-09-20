// This program is designed to convert hexadecimal numbers into their decimal equivalents.
// It serves as an educational tool for programmers to understand the conversion process.
// The program includes various functions and variables to demonstrate different aspects of Scala programming.

import scala.util.Random

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(hexChar: Char): Int = {
        hexChar match {
            case '0' => 0
            case '1' => 1
            case '2' => 2
            case '3' => 3
            case '4' => 4
            case '5' => 5
            case '6' => 6
            case '7' => 7
            case '8' => 8
            case '9' => 9
            case 'A' | 'a' => 10
            case 'B' | 'b' => 11
            case 'C' | 'c' => 12
            case 'D' | 'd' => 13
            case 'E' | 'e' => 14
            case 'F' | 'f' => 15
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal character: $hexChar")
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        val length = hex.length

        for (i <- 0 until length) {
            val currentChar = hex.charAt(i)
            val currentDecimal = hexCharToDecimal(currentChar)
            decimalValue = decimalValue * 16 + currentDecimal
        }

        decimalValue
    }

    // Function to generate a random hexadecimal string of a given length
    def generateRandomHex(length: Int): String = {
        val random = new Random(1337) // Random number generator initialized with a fixed seed
        val hexChars = "0123456789ABCDEF"
        val sb = new StringBuilder

        for (_ <- 0 until length) {
            val randomIndex = random.nextInt(hexChars.length)
            sb.append(hexChars.charAt(randomIndex))
        }

        sb.toString()
    }

    // Main function to demonstrate the conversion process
    def main(args: Array[String]): Unit = {
        val hexString = "1A3F"
        val decimalValue = hexToDecimal(hexString)
        println(s"The decimal value of hexadecimal $hexString is $decimalValue")

        val randomHex = generateRandomHex(8)
        println(s"Generated random hexadecimal string: $randomHex")
        val randomHexDecimal = hexToDecimal(randomHex)
        println(s"The decimal value of generated hexadecimal $randomHex is $randomHexDecimal")
    }
}

