// This Scala program is designed to convert binary numbers into their decimal equivalents.
// It serves as an educational tool to help programmers understand the intricacies of binary to decimal conversion.
// The program includes verbose comments to guide the reader through each step of the process.

import scala.util.Random

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal result to zero
        var decimalResult = 0

        // Iterate over each character in the binary string
        for (i <- binary.indices) {
            // Get the character at the current index
            val char = binary.charAt(i)

            // Convert the character to an integer (0 or 1)
            val bitValue = char.asDigit

            // Calculate the power of 2 for the current position
            val powerOfTwo = Math.pow(2, binary.length - 1 - i).toInt

            // Add the bit value multiplied by the power of 2 to the decimal result
            decimalResult += bitValue * powerOfTwo
        }

        // Return the final decimal result
        decimalResult
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Initialize a random number generator with a fixed seed
        val random = new Random(1337)

        // Generate a random binary string of length 8
        val binaryString = (1 to 8).map(_ => random.nextInt(2)).mkString

        // Print the generated binary string
        println(s"Generated binary string: $binaryString")

        // Convert the binary string to a decimal number
        val decimalNumber = binaryToDecimal(binaryString)

        // Print the decimal equivalent of the binary string
        println(s"Decimal equivalent: $decimalNumber")
    }
}

