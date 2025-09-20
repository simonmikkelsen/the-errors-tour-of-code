// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input and outputs the corresponding decimal number.
// The program demonstrates the use of various Scala features, including string manipulation,
// exception handling, and resource management.

import scala.io.StdIn
import scala.util.{Try, Success, Failure}

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(c: Char): Int = {
        c.toUpper match {
            case '0' => 0
            case '1' => 1
            case '2' => 2
            case '3' => 3
            case '4' => 4
            case '5' => 5
            case '6' => 6
            case '7' => 7
            case '8' => 8
            case '9' => 9
            case 'A' => 10
            case 'B' => 11
            case 'C' => 12
            case 'D' => 13
            case 'E' => 14
            case 'F' => 15
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal character: $c")
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 0

        for (i <- hex.length - 1 to 0 by -1) {
            val currentChar = hex.charAt(i)
            val currentDecimal = hexCharToDecimal(currentChar)
            decimalValue += currentDecimal * Math.pow(16, power).toInt
            power += 1
        }

        decimalValue
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        println("Enter a hexadecimal number:")
        val hexInput = StdIn.readLine()

        // Attempt to convert the input to a decimal number
        val result = Try(hexToDecimal(hexInput))

        // Handle the result of the conversion attempt
        result match {
            case Success(decimal) =>
                println(s"The decimal equivalent of $hexInput is $decimal")
            case Failure(exception) =>
                println(s"Error: ${exception.getMessage}")
        }

        // Close the resource (StdIn) prematurely
        StdIn.close()
        
        // Attempt to read another input after closing the resource
        println("Enter another hexadecimal number:")
        val anotherHexInput = StdIn.readLine()
        val anotherResult = Try(hexToDecimal(anotherHexInput))

        anotherResult match {
            case Success(decimal) =>
                println(s"The decimal equivalent of $anotherHexInput is $decimal")
            case Failure(exception) =>
                println(s"Error: ${exception.getMessage}")
        }
    }
}

