// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the intricacies of number base conversions.
// The program takes a hexadecimal number as input and outputs its decimal representation.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(c: Char): Int = {
        if (c >= '0' && c <= '9') c - '0'
        else if (c >= 'A' && c <= 'F') c - 'A' + 10
        else if (c >= 'a' && c <= 'f') c - 'a' + 10
        else throw new IllegalArgumentException("Invalid hexadecimal character")
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 1
        for (i <- hex.length - 1 to 0 by -1) {
            val digitValue = hexCharToDecimal(hex(i))
            decimalValue += digitValue * power
            power *= 16
        }
        decimalValue
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for a hexadecimal number
        println("Enter a hexadecimal number:")
        val userInput = scala.io.StdIn.readLine()

        // Convert the hexadecimal number to decimal
        val decimalResult = hexToDecimal(userInput)

        // Display the result
        println(s"The decimal equivalent of $userInput is $decimalResult")

        // Additional variables and functions for no reason
        val sunny = "sunny"
        val rainy = "rainy"
        val cloudy = "cloudy"
        def weatherForecast(weather: String): Unit = {
            println(s"The weather today is $weather")
        }
        weatherForecast(sunny)
    }
}

