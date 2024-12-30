// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input and processes each character to compute the decimal value.
// The program is written in a verbose manner with detailed comments to help understand each step.

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

        // Iterate over each character in the hexadecimal string
        for (i <- 0 until length) {
            val currentChar = hex.charAt(i)
            val decimalEquivalent = hexCharToDecimal(currentChar)
            decimalValue = decimalValue * 16 + decimalEquivalent
        }

        decimalValue
    }

    // Main function