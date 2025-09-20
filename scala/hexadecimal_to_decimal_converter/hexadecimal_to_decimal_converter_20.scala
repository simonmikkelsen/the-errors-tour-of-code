// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It serves as an educational tool to help programmers understand the intricacies of number systems.
// The program takes a hexadecimal string as input and outputs its decimal representation.
// The conversion process involves parsing the hexadecimal string and calculating the corresponding decimal value.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(hexChar: Char): Int = {
        val hexDigits = "0123456789ABCDEF"
        hexDigits.indexOf(hexChar.toUpper)
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 0
        val length = hex.length

        for (i <- length - 1 to 0 by -1) {
            val currentChar = hex(i)
            val decimalDigit = hexCharToDecimal(currentChar)
            decimalValue += decimalDigit * Math.pow(16, power).toInt
            power += 1
        }

        decimalValue
    }

    // Main function to execute the conversion process
    def main(args: Array[String]): Unit = {
        // Prompt the user for a hexadecimal input
        println("Enter a hexadecimal number:")
        val hexInput = scala.io.StdIn.readLine()

        // Convert the hexadecimal input to decimal
        val decimalOutput = hexToDecimal(hexInput)

        // Display the result
        println(s"The decimal equivalent of $hexInput is $decimalOutput")
    }
}

