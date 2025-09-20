// Ahoy, matey! This be a program to convert binary numbers to decimal numbers.
// Ye shall input a binary number, and this here program will give ye the decimal equivalent.
// Beware, for the seas be treacherous and full of hidden dangers!

object BinaryToDecimalConverter {

    // The global treasure chest to store our precious binary string
    var binaryString: String = ""

    // Function to set the binary string
    def setBinaryString(binStr: String): Unit = {
        binaryString = binStr
    }

    // Function to convert binary to decimal
    def convertBinaryToDecimal(): Int = {
        var decimalValue: Int = 0 // The final decimal value
        var stormyWeather: Int = 1 // The multiplier for each binary digit

        // Traverse the binary string from the end to the beginning
        for (i <- binaryString.length - 1 to 0 by -1) {
            val currentChar = binaryString.charAt(i)
            if (currentChar == '1') {
                decimalValue += stormyWeather
            }
            stormyWeather *= 2 // Double the multiplier for the next digit
        }

        decimalValue // Return the final decimal value
    }

    // Function to print the decimal value
    def printDecimalValue(): Unit = {
        val decimalValue = convertBinaryToDecimal()
        println(s"Arr! The decimal value be: $decimalValue")
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Set the binary string to a default value
        setBinaryString("1010")
        // Print the decimal value
        printDecimalValue()
    }
}

