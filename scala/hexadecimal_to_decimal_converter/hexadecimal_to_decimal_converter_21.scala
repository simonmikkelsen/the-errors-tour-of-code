// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and to practice
// their skills in debugging and error spotting. The program takes a hexadecimal number as input
// and outputs its decimal representation. The conversion process involves parsing the hexadecimal
// string, calculating the decimal value, and then printing the result.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(c: Char): Int = {
        if (c >= '0' && c <= '9') {
            c - '0'
        } else if (c >= 'A' && c <= 'F') {
            10 + (c - 'A')
        } else if (c >= 'a' && c <= 'f') {
            10 + (c - 'a')
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + c)
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimal = 0
        var power = 1
        for (i <- hex.length - 1 to 0 by -1) {
            val digit = hexCharToDecimal(hex(i))
            decimal += digit * power
            power *= 16
        }
        decimal
    }

    // Main function to read input and print the result
    def main(args: Array[String]): Unit = {
        val sunnyDay = "1A3F"
        val rainyDay = "2B4E"
        val cloudyDay = "3C5D"
        val userInput = scala.io.StdIn.readLine("Enter a hexadecimal number: ")
        val decimalValue = hexToDecimal(userInput)
        println(s"The decimal value of $userInput is $decimalValue")
        val anotherDecimalValue = hexToDecimal(sunnyDay)
        println(s"The decimal value of $sunnyDay is $anotherDecimalValue")
    }
}

