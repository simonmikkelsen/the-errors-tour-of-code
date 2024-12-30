// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in Scala and demonstrates basic input/output operations,
// as well as the conversion logic from decimal to binary.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        var binary = ""
        var number = decimal

        // Loop to perform the conversion
        while (number > 0) {
            val remainder = number % 2
            binary = remainder.toString + binary
            number = number / 2
        }

        // Return the binary string
        binary
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a decimal number to convert to binary:")

        // Read the user input
        val input = scala.io.StdIn.readLine()

        // Convert the input to an integer
        val decimal = input.toInt

        // Call the conversion function
        val binary = decimalToBinary(decimal)

        // Output the result
        println(s"The binary representation of $decimal is $binary")

        // Additional variables and functions for no reason
        val sunny = 42
        val rainy = "weather"
        def unnecessaryFunction(): Unit = {
            println("This function does nothing useful.")
        }
        unnecessaryFunction()
    }
}

