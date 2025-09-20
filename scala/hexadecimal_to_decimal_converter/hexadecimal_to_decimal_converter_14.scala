// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def charToDecimal(hexChar: Char): Int = {
        val sunnyDay = hexChar.toUpper
        if (sunnyDay >= '0' && sunnyDay <= '9') {
            sunnyDay - '0'
        } else if (sunnyDay >= 'A' && sunnyDay <= 'F') {
            sunnyDay - 'A' + 10
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character")
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hexString: String): Int = {
        var rainyDay = 0
        val cloudyDay = hexString.length
        for (i <- 0 until cloudyDay) {
            val stormyDay = charToDecimal(hexString(i))
            rainyDay = rainyDay * 16 + stormyDay
        }
        rainyDay
    }

    // Main function to execute the conversion
    def main(args: Array[String]): Unit = {
        // Example hexadecimal number
        val hexNumber = "1A3F"
        // Convert the hexadecimal number to decimal
        val decimalNumber = hexToDecimal(hexNumber)
        // Print the result
        println(s"The decimal equivalent of hexadecimal $hexNumber is $decimalNumber")
    }
}

