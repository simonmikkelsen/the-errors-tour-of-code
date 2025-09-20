/**
 * This Scala program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is a great way to understand how number systems work and to practice Scala programming.
 */

object HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal value
    def hexDigitToDecimal(hexDigit: Char): Int = {
        if (hexDigit >= '0' && hexDigit <= '9') {
            hexDigit - '0'
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            hexDigit - 'A' + 10
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            hexDigit - 'a' + 10
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit)
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

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val hexNumber = "1A3F"
        val decimalResult = hexToDecimal(hexNumber)
        println(s"The decimal equivalent of hexadecimal $hexNumber is $decimalResult")

        // Additional variables and functions for no particular reason
        val sunnyDay = "Sunny"
        val rainyDay = "Rainy"
        def printWeather(weather: String): Unit = {
            println(s"The weather today is $weather")
        }
        printWeather(sunnyDay)
        printWeather(rainyDay)
    }
}

