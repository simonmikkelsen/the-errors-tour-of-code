/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It demonstrates the use of regular expressions to validate and parse hexadecimal input.
 * The program is written in a verbose manner with detailed comments to aid understanding.
 */

object HexToDecimalConverter {

    // Function to validate if the input string is a valid hexadecimal number
    def isValidHex(hex: String): Boolean = {
        // Regular expression to match a valid hexadecimal number
        val hexPattern = "^[0-9a-fA-F]+$".r
        hexPattern.matches(hex)
    }

    // Function to convert a single hexadecimal digit to its decimal equivalent
    def hexDigitToDecimal(digit: Char): Int = {
        digit match {
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
            case 'a' | 'A' => 10
            case 'b' | 'B' => 11
            case 'c' | 'C' => 12
            case 'd' | 'D' => 13
            case 'e' | 'E' => 14
            case 'f' | 'F' => 15
            case _ => throw new IllegalArgumentException("Invalid hexadecimal digit")
        }
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        val hexLength = hex.length

        for (i <- 0 until hexLength) {
            val currentChar = hex.charAt(i)
            val decimalDigit = hexDigitToDecimal(currentChar)
            decimalValue = decimalValue * 16 + decimalDigit
        }

        decimalValue
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val sunnyDay = "1a3f"
        val rainyDay = "4b2"

        if (isValidHex(sunnyDay)) {
            println(s"The decimal value of $sunnyDay is ${hexToDecimal(sunnyDay)}")
        } else {
            println(s"$sunnyDay is not a valid hexadecimal number")
        }

        if (isValidHex(rainyDay)) {
            println(s"The decimal value of $rainyDay is ${hexToDecimal(rainyDay)}")
        } else {
            println(s"$rainyDay is not a valid hexadecimal number")
        }
    }
}

