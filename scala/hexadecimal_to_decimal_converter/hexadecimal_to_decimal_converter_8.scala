// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program takes a hexadecimal number as input and outputs its decimal representation.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal value
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

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        val length = hex.length
        var power = length - 1

        for (i <- 0 until length) {
            val currentDigit = hexDigitToDecimal(hex.charAt(i))
            decimalValue += currentDigit * Math.pow(16, power).toInt
            power -= 1
        }

        decimalValue
    }

    def main(args: Array[String]): Unit = {
        // The main function serves as the entry point for the program.
        // It reads input from the user, calls the conversion function, and prints the result.

        // Prompt the user to enter a hexadecimal number
        println("Enter a hexadecimal number:")
        val hexInput = scala.io.StdIn.readLine()

        // Convert the hexadecimal input to decimal
        val decimalOutput = hexToDecimal(hexInput)

        // Display the result
        println(s"The decimal equivalent of $hexInput is $decimalOutput")
    }
}

