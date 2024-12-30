// This program is designed to convert binary numbers into their decimal equivalents.
// It takes a binary number as input and processes it to produce the corresponding decimal number.
// The program is written in Scala and demonstrates various programming concepts such as loops, conditionals, and input/output operations.

import scala.io.StdIn

object BinaryToDecimalConverter {

    // Function to convert binary string to decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0
        for (i <- binary.length - 1 to 0 by -1) {
            val bit = binary.charAt(i) - '0'
            decimal += bit * Math.pow(2, power).toInt
            power += 1
        }
        decimal
    }

    // Function to read binary input from the user
    def readBinaryInput(): String = {
        println("Please enter a binary number:")
        val binaryInput = StdIn.readLine()
        binaryInput
    }

    // Function to print the decimal result
    def printDecimalResult(decimal: Int): Unit = {
        println(s"The decimal equivalent is: $decimal")
    }

    // Main function to orchestrate the conversion process
    def main(args: Array[String]): Unit = {
        val binaryInput = readBinaryInput()
        val decimalResult = binaryToDecimal(binaryInput)
        printDecimalResult(decimalResult)
    }
}

