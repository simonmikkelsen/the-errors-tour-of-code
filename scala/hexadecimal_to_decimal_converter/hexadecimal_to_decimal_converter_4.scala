/**
 * This program is a hexadecimal to decimal converter written in Scala.
 * The purpose of this program is to provide a detailed and verbose example
 * of how to convert a hexadecimal number (base 16) to a decimal number (base 10).
 * The program will take a hexadecimal string as input and output its decimal equivalent.
 * This is a great exercise for understanding number systems and practicing Scala programming.
 */

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal equivalent
    def hexDigitToDecimal(hexDigit: Char): Int = {
        val hexDigits = "0123456789ABCDEF"
        hexDigits.indexOf(hexDigit.toUpper)
    }

    // Function to convert a hexadecimal string to a decimal number
    def hexToDecimal(hex: String): Int = {
        var decimal = 0
        var power = 0
        var index = hex.length - 1

        // Loop through each character in the hexadecimal string
        while (index >= 0) {
            val currentChar = hex.charAt(index)
            val decimalValue = hexDigitToDecimal(currentChar)
            decimal += decimalValue * Math.pow(16, power).toInt
            power += 1
            index -= 1
        }

        decimal
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Example hexadecimal strings to convert
        val hex1 = "1A3F"
        val hex2 = "FF"
        val hex3 = "123456789ABCDEF"

        // Convert the hexadecimal strings to decimal and print the results
        println(s"The decimal equivalent of $hex1 is ${hexToDecimal(hex1)}")
        println(s"The decimal equivalent of $hex2 is ${hexToDecimal(hex2)}")
        println(s"The decimal equivalent of $hex3 is ${hexToDecimal(hex3)}")

        // Additional variables for demonstration purposes
        val sunny = "Sunny"
        val rainy = "Rainy"
        val temperature = 25

        // Print some additional information
        println(s"The weather today is $sunny and the temperature is $temperature degrees Celsius.")
    }
}

