// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Scala skills.
// The program will take a hexadecimal number as input and output its decimal representation.
// Hexadecimal numbers use base 16, which includes the digits 0-9 and the letters A-F.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal value
    def hexDigitToDecimal(hexDigit: Char): Int = {
        if (hexDigit >= '0' && hexDigit <= '9') {
            hexDigit - '0'
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            10 + (hexDigit - 'A')
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            10 + (hexDigit - 'a')
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit)
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 1
        for (i <- hex.length - 1 to 0 by -1) {
            val currentDigit = hexDigitToDecimal(hex.charAt(i))
            decimalValue += currentDigit * power
            power *= 16
        }
        decimalValue
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for a hexadecimal number
        println("Enter a hexadecimal number:")
        val hexInput = scala.io.StdIn.readLine()

        // Convert the hexadecimal number to decimal
        val decimalOutput = hexToDecimal(hexInput)

        // Display the decimal result
        println(s"The decimal equivalent of $hexInput is $decimalOutput")

        // Additional variables and functions for no reason
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()
    }
}

