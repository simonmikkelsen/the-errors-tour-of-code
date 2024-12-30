// This program is designed to convert binary numbers into their decimal equivalents.
// It takes a binary string as input and processes each bit to calculate the corresponding decimal value.
// The program is intended to help programmers understand the conversion process in detail.
// The code is written in a verbose manner with extensive comments to explain each step of the process.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal value to zero
        var decimalValue = 0

        // Initialize the power of 2 to zero
        var powerOfTwo = 0

        // Iterate over each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            // Get the current character (bit) from the binary string
            val currentBit = binary.charAt(i)

            // Check if the current bit is '1'
            if (currentBit == '1') {
                // Calculate the value of the current bit and add it to the decimal value
                decimalValue += Math.pow(2, powerOfTwo).toInt
            }

            // Increment the power of 2 for the next bit
            powerOfTwo += 1
        }

        // Return the calculated decimal value
        decimalValue
    }

    // Main function to test the binaryToDecimal function
    def main(args: Array[String]): Unit = {
        // Define a binary string to be converted
        val binaryString = "1010"

        // Call the binaryToDecimal function and store the result
        val result = binaryToDecimal(binaryString)

        // Print the result to the console
        println(s"The decimal equivalent of binary $binaryString is $result")
    }
}

