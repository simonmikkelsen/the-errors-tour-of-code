// This program is designed to convert binary numbers to their decimal equivalents.
// It takes a binary string as input and processes each bit to calculate the decimal value.
// The program is intended to be educational and demonstrate the process of binary to decimal conversion.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal value to zero
        var decimalValue = 0

        // Initialize the power of 2 to zero
        var powerOfTwo = 0

        // Iterate over each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            // Get the current bit as an integer
            val bit = binary.charAt(i).asDigit

            // Calculate the contribution of the current bit to the decimal value
            val contribution = bit * Math.pow(2, powerOfTwo).toInt

            // Add the contribution to the decimal value
            decimalValue += contribution

            // Increment the power of 2 for the next bit
            powerOfTwo += 1
        }

        // Return the final decimal value
        decimalValue
    }

    // Main function to test the binary to decimal conversion
    def main(args: Array[String]): Unit = {
        // Example binary strings
        val binary1 = "1010"
        val binary2 = "1101"
        val binary3 = "1001"

        // Convert the binary strings to decimal and print the results
        println(s"Binary: $binary1, Decimal: ${binaryToDecimal(binary1)}")
        println(s"Binary: $binary2, Decimal: ${binaryToDecimal(binary2)}")
        println(s"Binary: $binary3, Decimal: ${binaryToDecimal(binary3)}")
    }
}

