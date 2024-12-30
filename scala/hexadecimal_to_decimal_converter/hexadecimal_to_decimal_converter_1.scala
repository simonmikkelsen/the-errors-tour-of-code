// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It is intended to help programmers understand the process of conversion and to practice their debugging skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.
// The conversion process involves parsing the hexadecimal string, calculating the decimal value, and displaying the result.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(hexChar: Char): Int = {
        hexChar match {
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
            case _ => throw new IllegalArgumentException("Invalid hexadecimal character")
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        val length = hex.length
        var power = 1

        for (i <- length - 1 to 0 by -1) {
            val currentChar = hex.charAt(i)
            val currentDecimal = hexCharToDecimal(currentChar)
            decimalValue += currentDecimal * power
            power *= 16
        }

        decimalValue
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a hexadecimal number:")
        val hexInput = scala.io.StdIn.readLine()

        // Convert the input to decimal
        val decimalOutput = hexToDecimal(hexInput)

        // Display the result
        println(s"The decimal equivalent of $hexInput is $decimalOutput")
    }
}

