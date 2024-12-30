// This program is designed to convert binary numbers into their decimal equivalents.
// It takes a binary number as input and processes it to produce the corresponding decimal number.
// The program is written in Scala and demonstrates various programming concepts.
// The purpose of this program is to provide a comprehensive example of binary to decimal conversion.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal result to zero
        var decimalResult = 0
        // Initialize the base value to 1 (2^0)
        var base = 1
        // Initialize a variable to store the length of the binary string
        val length = binary.length

        // Loop through each character in the binary string from right to left
        for (i <- length - 1 to 0 by -1) {
            // If the character is '1', add the current base value to the decimal result
            if (binary.charAt(i) == '1') {
                decimalResult += base
            }
            // Multiply the base value by 2 for the next position
            base *= 2
        }

        // Return the final decimal result
        decimalResult
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Binary to Decimal Converter!")

        // Define a binary number as a string
        val binaryNumber = "1010"

        // Print the binary number
        println(s"The binary number is: $binaryNumber")

        // Convert the binary number to a decimal number
        val decimalNumber = binaryToDecimal(binaryNumber)

        // Print the decimal number
        println(s"The decimal equivalent is: $decimalNumber")

        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        println(s"The weather today is: $weather")

        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        val anotherVariable = 42
        println(s"Another variable: $anotherVariable")

        // End of the program
        println("Thank you for using the Binary to Decimal Converter!")
    }
}

