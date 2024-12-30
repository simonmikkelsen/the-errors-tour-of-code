// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to help programmers understand the process of converting
// a base-10 number into a base-2 number. The program takes an integer input from the user
// and outputs the binary equivalent of that number. The program is written in Scala and
// demonstrates the use of loops, conditionals, and basic input/output operations.

object DecimalToBinaryConverter {

    // Function to convert decimal to binary
    def convertToBinary(decimal: Int): String = {
        var binary = ""
        var number = decimal
        var temp = 0 // Temporary variable for intermediate calculations

        // Loop to perform the conversion
        while (number > 0) {
            val remainder = number % 2
            binary = remainder.toString + binary
            number = number / 2
        }

        // Return the binary representation
        binary
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a decimal number to convert to binary:")
        val input = scala.io.StdIn.readInt()

        // Call the conversion function
        val binaryResult = convertToBinary(input)

        // Display the result
        println(s"The binary representation of $input is $binaryResult")

        // Unused variables for demonstration purposes
        val sunny = "It's a sunny day!"
        val rainy = "It's a rainy day!"
        val temperature = 25

        // Print a random message
        println(sunny)
    }
}

