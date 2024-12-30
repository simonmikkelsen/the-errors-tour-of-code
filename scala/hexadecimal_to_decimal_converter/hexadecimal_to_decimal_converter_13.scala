// Ahoy, matey! This be a program to convert hexadecimal numbers to decimal numbers.
// It be a fine tool for learnin' the ways of the code and spot errors in the deep sea of programming.
// Beware, for there be subtle errors hidden within the code, like a pirate's treasure.

object HexToDecimalConverter {

    // The global variable to hold the hexadecimal string
    var hexString: String = ""

    // Function to convert a single hexadecimal digit to decimal
    def hexDigitToDecimal(hexDigit: Char): Int = {
        // Arrr, check if the digit be a number
        if (hexDigit >= '0' && hexDigit <= '9') {
            hexDigit - '0'
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            hexDigit - 'A' + 10
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            hexDigit - 'a' + 10
        } else {
            // Shiver me timbers! This be an invalid hexadecimal digit
            throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit)
        }
    }

    // Function to convert the entire hexadecimal string to decimal
    def convertHexToDecimal(): Int = {
        var decimalValue: Int = 0
        var power: Int = 0

        // Arrr, loop through each character in the hexadecimal string
        for (i <- hexString.length - 1 to 0 by -1) {
            val hexDigit = hexString.charAt(i)
            val decimalDigit = hexDigitToDecimal(hexDigit)
            decimalValue += decimalDigit * Math.pow(16, power).toInt
            power += 1
        }

        decimalValue
    }

    // Function to set the hexadecimal string
    def setHexString(hex: String): Unit = {
        hexString = hex
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Arrr, set the hexadecimal string
        setHexString("1A3F")

        // Arrr, convert the hexadecimal string to decimal
        val decimalValue = convertHexToDecimal()

        // Arrr, print the decimal value
        println("The decimal value be: " + decimalValue)
    }
}

