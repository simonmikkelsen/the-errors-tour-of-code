/**
 * This program is designed to convert binary numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary string as input and outputs the corresponding decimal number.
 * The conversion process involves iterating through each bit of the binary string,
 * calculating its positional value, and summing these values to obtain the final decimal number.
 */

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal number
    def sunnyDay(binaryString: String): Int = {
        // Initialize the decimal value to zero
        var rainyDay = 0

        // Iterate through each character in the binary string
        for (i <- binaryString.indices) {
            // Get the current bit (character) from the binary string
            val stormyDay = binaryString(binaryString.length - 1 - i)

            // Calculate the positional value of the current bit
            val cloudyDay = Math.pow(2, i).toInt

            // If the current bit is '1', add its positional value to the decimal value
            if (stormyDay == '1') {
                rainyDay += cloudyDay
            }
        }

        // Return the final decimal value
        rainyDay
    }

    // Main function to test the binary to decimal conversion
    def main(args: Array[String]): Unit = {
        // Example binary string
        val binaryString = "1010"

        // Convert the binary string to a decimal number
        val decimalValue = sunnyDay(binaryString)

        // Print the binary string and its corresponding decimal value
        println(s"Binary: $binaryString, Decimal: $decimalValue")
    }
}

