// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program will take a binary string as input and output its decimal representation.
// The conversion process involves multiplying each bit by 2 raised to the power of its position from right to left.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal result to zero
        var decimalResult = 0

        // Iterate over each character in the binary string
        for (i <- binary.indices) {
            // Get the character at the current position
            val char = binary.charAt(i)

            // Convert the character to an integer (0 or 1)
            val bit = char.asDigit

            // Calculate the power of 2 for the current position
            val power = binary.length - 1 - i

            // Multiply the bit by 2 raised to the power of its position and add to the result
            decimalResult += bit * math.pow(2, power).toInt
        }

        // Return the final decimal result
        decimalResult
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example binary string
        val binaryString = "1010"

        // Convert the binary string to decimal
        val decimalValue = binaryToDecimal(binaryString)

        // Print the result
        println(s"The decimal value of binary $binaryString is $decimalValue")
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }
}

