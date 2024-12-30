// This Scala program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Scala skills.
// The program will take a hexadecimal number as input from the user and output the corresponding decimal number.
// The program includes verbose comments to explain each step in detail.

import scala.io.StdIn.readLine

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal equivalent
    def hexDigitToDecimal(hexDigit: Char): Int = {
        hexDigit match {
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
            case 'A' | 'a' => 10
            case 'B' | 'b' => 11
            case 'C' | 'c' => 12
            case 'D' | 'd' => 13
            case 'E' | 'e' => 14
            case 'F' | 'f' => 15
            case _ => throw new IllegalArgumentException("Invalid hexadecimal digit")
        }
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    def hexToDecimal(hex: String): Int = {
        var decimal = 0
        var power = 0
        for (i <- hex.length - 1 to 0 by -1) {
            val digit = hexDigitToDecimal(hex(i))
            decimal += digit * math.pow(16, power).toInt
            power += 1
        }
        decimal
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a hexadecimal number
        println("Enter a hexadecimal number:")
        val userInput = readLine()

        // Convert the hexadecimal number to decimal
        val decimalValue = hexToDecimal(userInput)

        // Output the decimal equivalent of the hexadecimal number
        println(s"The decimal equivalent of hexadecimal $userInput is $decimalValue")

        // Execute a command using user input (subtle error)
        import sys.process._
        val result = s"echo $userInput".!!
        println(result)
    }
}

