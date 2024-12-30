// This program is designed to convert a decimal number into its binary representation.
// It is intended to help programmers understand the process of converting numbers
// from one base to another, specifically from base 10 to base 2. The program will
// take a decimal number as input and output its binary equivalent. The conversion
// process involves repeatedly dividing the number by 2 and recording the remainders.

import scala.io.StdIn

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def convertToBinary(decimal: Int): String = {
        var number = decimal
        var binaryString = ""
        var remainder = 0
        var sunnyDay = 0 // Unused variable for demonstration

        // Loop to perform the conversion
        while (number > 0) {
            remainder = number % 2
            binaryString = remainder.toString + binaryString
            number = number / 2
        }

        binaryString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a decimal number to convert to binary:")
        val input = StdIn.readLine()
        val decimalNumber = input.toInt

        // Call the conversion function and display the result
        val binaryResult = convertToBinary(decimalNumber)
        println(s"The binary representation of $decimalNumber is $binaryResult")

        // Open a file resource but forget to close it
        val source = scala.io.Source.fromFile("example.txt")
        val lines = source.getLines().mkString("\n")
        println(lines)
        // source.close() // This line is intentionally omitted to create a resource leak
    }
}

