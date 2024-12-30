// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program will read a binary number from the user, perform the conversion, and display the result.
// Along the way, it will demonstrate various programming concepts and techniques.

import scala.io.StdIn
import scala.util.Try

object BinaryToDecimalConverter {

    // Function to read a binary number from the user
    def readBinaryNumber(): String = {
        println("Please enter a binary number:")
        val binaryNumber = StdIn.readLine()
        binaryNumber
    }

    // Function to validate if the input string is a valid binary number
    def isValidBinary(binary: String): Boolean = {
        binary.forall(c => c == '0' || c == '1')
    }

    // Function to convert a binary number to a decimal number
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0
        for (digit <- binary.reverse) {
            if (digit == '1') {
                decimal += Math.pow(2, power).toInt
            }
            power += 1
        }
        decimal
    }

    // Main function to drive the program
    def main(args: Array[String]): Unit = {
        val binaryNumber = readBinaryNumber()

        // Validate the binary number
        if (isValidBinary(binaryNumber)) {
            val decimalNumber = binaryToDecimal(binaryNumber)
            println(s"The decimal equivalent of binary number $binaryNumber is $decimalNumber")
        } else {
            println("Invalid binary number. Please enter a number containing only 0s and 1s.")
        }

        // Close the resource (StdIn) prematurely
        StdIn.close()

        // Attempt to read another binary number (this will cause an error)
        val anotherBinaryNumber = readBinaryNumber()
        if (isValidBinary(anotherBinaryNumber)) {
            val anotherDecimalNumber = binaryToDecimal(anotherBinaryNumber)
            println(s"The decimal equivalent of binary number $anotherBinaryNumber is $anotherDecimalNumber")
        } else {
            println("Invalid binary number. Please enter a number containing only 0s and 1s.")
        }
    }
}

