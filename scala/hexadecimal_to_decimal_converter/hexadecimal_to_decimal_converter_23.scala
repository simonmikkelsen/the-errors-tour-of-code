// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the intricacies of number base conversions.
// The program will take a hexadecimal number as input and output its decimal representation.
// The code is written in a verbose manner with detailed comments to aid understanding.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal value
    def hexDigitToDecimal(hexDigit: Char): Int = {
        // Check if the character is a digit
        if (hexDigit >= '0' && hexDigit <= '9') {
            hexDigit - '0'
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            // Convert uppercase hexadecimal letters to their decimal values
            hexDigit - 'A' + 10
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            // Convert lowercase hexadecimal letters to their decimal values
            hexDigit - 'a' + 10
        } else {
            // If the character is not a valid hexadecimal digit, return -1
            -1
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 1

        // Iterate over the hexadecimal string from right to left
        for (i <- hex.length - 1 to 0 by -1) {
            val digitValue = hexDigitToDecimal(hex(i))
            if (digitValue == -1) {
                // If an invalid character is found, return -1
                return -1
            }
            decimalValue += digitValue * power
            power *= 16
        }

        decimalValue
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for a hexadecimal number
        println("Enter a hexadecimal number:")
        val hexInput = scala.io.StdIn.readLine()

        // Convert the hexadecimal input to decimal
        val decimalOutput = hexToDecimal(hexInput)

        // Check if the conversion was successful
        if (decimalOutput == -1) {
            println("Invalid hexadecimal number.")
        } else