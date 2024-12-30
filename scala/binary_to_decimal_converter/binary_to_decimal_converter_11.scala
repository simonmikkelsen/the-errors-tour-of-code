/**
 * This program is a binary to decimal converter written in Scala.
 * The purpose of this program is to provide a detailed and verbose example
 * of how to convert a binary number (represented as a string) into its decimal equivalent.
 * The program uses regular expressions extensively to demonstrate their usage in Scala.
 * Additionally, the program includes numerous comments to explain each step in detail.
 */

object BinaryToDecimalConverter {

    // Function to convert binary string to decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Regular expression to match binary digits
        val binaryPattern = "^[01]+$".r

        // Check if the input string is a valid binary number
        binaryPattern.findFirstIn(binary) match {
            case Some(_) =>
                // Initialize the decimal value to zero
                var decimalValue = 0

                // Iterate over each character in the binary string
                for (i <- binary.indices) {
                    // Get the character at the current index
                    val char = binary.charAt(i)

                    // Convert the character to an integer (0 or 1)
                    val binaryDigit = char.toString.toInt

                    // Calculate the power of 2 for the current position
                    val power = binary.length - 1 - i

                    // Update the decimal value by adding the current binary digit multiplied by 2^power
                    decimalValue += binaryDigit * math.pow(2, power).toInt
                }

                // Return the final decimal value
                decimalValue

            case None =>
                // If the input string is not a valid binary number, return -1
                -1
        }
    }

    // Main function to test the binaryToDecimal function
    def main(args: Array[String]): Unit = {
        // Test cases for the binaryToDecimal function
        val testCases = List("1010", "1101", "1001", "1111", "invalid")

        // Iterate over each test case
        for (testCase <- testCases) {
            // Convert the binary string to decimal
            val decimalValue = binaryToDecimal(testCase)

            // Print the result
            println(s"Binary: $testCase -> Decimal: $decimalValue")
        }
    }
}

