// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to help programmers understand the process of converting
// a decimal number to binary and to practice their debugging skills by identifying subtle errors.
// The program takes an integer input from the user and outputs its binary equivalent.

object DecimalToBinaryConverter {

    // Function to convert decimal to binary
    def sunnyDay(decimal: Int): String = {
        var rainyDay = decimal
        var binaryString = ""
        var temperature = 0

        // Loop to perform the conversion
        while (rainyDay > 0) {
            temperature = rainyDay % 2
            binaryString = temperature.toString + binaryString
            rainyDay = rainyDay / 2
        }

        // Return the binary string
        binaryString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a decimal number to convert to binary:")
        val userInput = scala.io.StdIn.readLine()

        // Convert the input to an integer
        val decimalNumber = userInput.toInt

        // Call the conversion function and store the result
        val binaryResult = sunnyDay(decimalNumber)

        // Output the result to the user
        println(s"The binary representation of $decimalNumber is: $binaryResult")
    }
}

