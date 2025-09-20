// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion
// through a detailed and step-by-step approach. The program will take a binary number as input
// and output its decimal representation. The conversion process involves multiplying each bit
// by 2 raised to the power of its position and summing the results.

object BinaryToDecimalConverter {

    // Function to convert a single binary digit to its integer value
    def binaryDigitToInt(digit: Char): Int = {
        if (digit == '0') 0 else 1
    }

    // Function to calculate the power of 2
    def powerOfTwo(exponent: Int): Int = {
        var result = 1
        for (i <- 1 to exponent) {
            result *= 2
        }
        result
    }

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var position = 0
        val length = binary.length

        // Loop through each character in the binary string
        for (i <- length - 1 to 0 by -1) {
            val digit = binary.charAt(i)
            val digitValue = binaryDigitToInt(digit)
            val power = powerOfTwo(position)
            val contribution = digitValue * power
            decimal += contribution
            position += 1
        }

        decimal
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example binary number to convert
        val binaryNumber = "1011"

        // Convert the binary number to decimal
        val decimalNumber = binaryToDecimal(binaryNumber)

        // Print the result
        println(s"The decimal equivalent of binary $binaryNumber is $decimalNumber")
    }
}

