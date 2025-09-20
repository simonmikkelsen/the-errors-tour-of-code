// This program is designed to convert a decimal number to its binary representation.
// It showcases the use of regular expressions and various Scala programming constructs.
// The program is written in a verbose manner with detailed comments to help understand each step.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        // Regular expression to match decimal digits
        val decimalPattern = """\d+""".r

        // Check if the input is a valid decimal number
        val decimalString = decimal.toString
        val isValidDecimal = decimalPattern.matches(decimalString)

        // If the input is not a valid decimal number, return an error message
        if (!isValidDecimal) {
            return "Invalid decimal number"
        }

        // Initialize variables for the conversion process
        var binaryString = ""
        var quotient = decimal
        var remainder = 0

        // Loop to perform the conversion from decimal to binary
        while (quotient != 0) {
            remainder = quotient % 2
            binaryString = remainder.toString + binaryString
            quotient = quotient / 2
        }

        // Return the binary representation
        binaryString
    }

    // Main function to test the decimal to binary conversion
    def main(args: Array[String]): Unit = {
        // Test cases for the conversion function
        val testCases = List(10, 15, 255, 1024, 0, -1, 3.14)

        // Loop through each test case and print the result
        for (testCase <- testCases) {
            val binaryResult = decimalToBinary(testCase)
            println(s"Decimal: $testCase -> Binary: $binaryResult")
        }
    }
}

