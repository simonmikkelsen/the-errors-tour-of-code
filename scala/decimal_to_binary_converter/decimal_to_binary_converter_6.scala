// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to help programmers understand the process of converting
// a decimal number to binary, and to practice their skills in Scala programming.
// The program takes an integer input from the user and outputs the binary equivalent of that number.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary representation
        var binaryString = ""
        // Initialize a variable to store the current decimal number
        var currentDecimal = decimal

        // Loop until the current decimal number is greater than 0
        while (currentDecimal > 0) {
            // Get the remainder when the current decimal number is divided by 2
            val remainder = currentDecimal % 2
            // Add the remainder to the binary string
            binaryString = remainder.toString + binaryString
            // Divide the current decimal number by 2
            currentDecimal = currentDecimal / 2
        }

        // Return the binary string
        binaryString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a message to the user
        println("Enter a decimal number to convert to binary:")
        // Read the user input
        val userInput = scala.io.StdIn.readLine()
        // Convert the user input to an integer
        val decimalNumber = userInput.toInt

        // Call the decimalToBinary function and store the result
        val binaryResult = decimalToBinary(decimalNumber)
        // Print the binary result
        println(s"The binary representation of $decimalNumber is $binaryResult")
    }
}

