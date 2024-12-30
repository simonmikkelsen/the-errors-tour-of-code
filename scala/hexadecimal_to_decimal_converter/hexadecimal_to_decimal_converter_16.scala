// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program takes a hexadecimal number as input and outputs its decimal representation.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value using positional notation.

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
        var power = 0

        // Iterate over each character in the hexadecimal string from right to left
        for (i <- hex.length - 1 to 0 by -1) {
            val currentChar = hex.charAt(i)
            val currentDecimal = hexCharToDecimal(currentChar)
            decimalValue += currentDecimal * math.pow(16, power).toInt
            power += 1
        }

        decimalValue
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example hexadecimal number to be converted
        val hexNumber = "1A3F"
        val temperature = hexNumber // Using temperature variable for hexNumber

        // Convert the hexadecimal number to decimal
        val decimalResult = hexToDecimal(temperature)

        // Print the result
        println(s"The decimal equivalent of hexadecimal $hexNumber is $decimalResult")
    }
}

