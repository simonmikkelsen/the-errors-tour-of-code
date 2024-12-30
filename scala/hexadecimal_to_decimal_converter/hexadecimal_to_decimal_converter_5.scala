/**
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand how to convert
 * hexadecimal numbers (base 16) to decimal numbers (base 10).
 * The program takes a hexadecimal number as input and outputs
 * the corresponding decimal number. Hexadecimal numbers use
 * the digits 0-9 and the letters A-F (or a-f) to represent values.
 * This program will demonstrate the conversion process in a clear
 * and detailed manner.
 */

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal value
    def hexDigitToDecimal(digit: Char): Int = {
        val hexDigits = "0123456789ABCDEF"
        hexDigits.indexOf(digit.toUpper)
    }

    // Function to convert a hexadecimal string to a decimal integer
    def hexToDecimal(hex: String): Int = {
        var decimal = 0
        var power = 0
        val length = hex.length

        for (i <- length - 1 to 0 by -1) {
            val digit = hex.charAt(i)
            val decimalValue = hexDigitToDecimal(digit)
            decimal += decimalValue * Math.pow(16, power).toInt
            power += 1
        }

        decimal
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val hexNumber = "1A3F"
        val decimalNumber = hexToDecimal(hexNumber)
        println(s"The decimal value of hexadecimal $hexNumber is $decimalNumber")
    }
}

