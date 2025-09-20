// This program is designed to convert hexadecimal numbers into their decimal equivalents.
// Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal string as input and output its decimal value.
// The program is written in Scala, a powerful language that combines object-oriented and functional programming.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(hexChar: Char): Int = {
        if (hexChar >= '0' && hexChar <= '9') {
            hexChar - '0'
        } else if (hexChar >= 'A' && hexChar <= 'F') {
            hexChar - 'A' + 10
        } else if (hexChar >= 'a' && hexChar <= 'f') {
            hexChar - 'a' + 10
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar)
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 1
        for (i <- hex.length - 1 to 0 by -1) {
            val currentChar = hex.charAt(i)
            val currentDecimal = hexCharToDecimal(currentChar)
            decimalValue += currentDecimal * power
            power *= 16
        }
        decimalValue
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val hexNumber = "1A3F" // Example hexadecimal number
        val decimalNumber = hexToDecimal(hexNumber)
        println(s"The decimal value of hexadecimal $hexNumber is $decimalNumber")
    }
}

