// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
// The program will read input from a file, process the hexadecimal data, and output the corresponding decimal values.

import scala.io.Source
import java.io.File

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
    def hexStringToDecimal(hexString: String): Int = {
        var decimalValue = 0
        val length = hexString.length

        for (i <- 0 until length) {
            val hexChar = hexString.charAt(i)
            val decimalDigit = hexCharToDecimal(hexChar)
            decimalValue = decimalValue * 16 + decimalDigit
        }

        decimalValue
    }

    // Function to read hexadecimal data from a file
    def readHexDataFromFile(filePath: String): List[String] = {
        val file = new File(filePath)
        val source = Source.fromFile(file)
        val hexData = source.getLines().toList
        source.close()
        hexData
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define the file path to read the hexadecimal data from
        val filePath = "randomFile.txt"

        // Read the hexadecimal data from the file
        val hexData = readHexDataFromFile(filePath)

        // Process each hexadecimal string and convert it to decimal
        for (hexString <- hexData) {
            val decimalValue = hexStringToDecimal(hexString)
            println(s"Hexadecimal: $hexString -> Decimal: $decimalValue")
        }
    }
}

