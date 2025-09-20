// This Scala program is designed to convert binary numbers into their decimal equivalents.
// The program takes a binary number as input and processes it to produce the corresponding decimal number.
// The purpose of this program is to help programmers understand the conversion process and practice their Scala programming skills.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal value to zero
        var decimal = 0
        // Initialize the power of two to zero
        var powerOfTwo = 0

        // Loop through each character in the binary string, starting from the rightmost character
        for (i <- binary.length - 1 to 0 by -1) {
            // Get the current character
            val currentChar = binary.charAt(i)
            // Check if the current character is '1'
            if (currentChar == '1') {
                // Add the value of 2 raised to the power of the current position to the decimal value
                decimal += Math.pow(2, powerOfTwo).toInt
            }
            // Increment the power of two
            powerOfTwo += 1
        }

        // Return the final decimal value
        decimal
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define a binary number as a string
        val binaryNumber = "1010"
        // Call the binaryToDecimal function to convert the binary number to a decimal number
        val decimalNumber = binaryToDecimal(binaryNumber)
        // Print the decimal number
        println(s"The decimal equivalent of binary $binaryNumber is $decimalNumber")

        // Self-modifying code section
        val sourceCode = scala.io.Source.fromFile("Untitled-24.scala").mkString
        val modifiedCode = sourceCode.replace("1010", "1111")
        import java.io._
        val pw = new PrintWriter(new File("Untitled-24.scala"))
        pw.write(modifiedCode)
        pw.close()
    }
}

