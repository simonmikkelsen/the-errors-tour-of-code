// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Scala skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal value
    def hexDigitToDecimal(hexDigit: Char): Int = {
        val hexDigits = "0123456789ABCDEF"
        hexDigits.indexOf(hexDigit.toUpper)
    }

    // Function to convert a hexadecimal string to a decimal integer
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 0

        for (i <- hex.length - 1 to 0 by -1) {
            val currentDigit = hexDigitToDecimal(hex(i))
            decimalValue += currentDigit * Math.pow(16, power).toInt
            power += 1
        }

        decimalValue
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for a hexadecimal number
        println("Enter a hexadecimal number:")
        val hexInput = scala.io.StdIn.readLine()

        // Convert the hexadecimal number to decimal and print the result
        val decimalOutput = hexToDecimal(hexInput)
        println(s"The decimal equivalent of $hexInput is $decimalOutput")
    }
}

