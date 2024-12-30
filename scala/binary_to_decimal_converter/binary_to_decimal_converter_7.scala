// This program is a binary to decimal converter written in Scala.
// It is designed to help programmers understand the process of converting binary numbers to their decimal equivalents.
// The program takes a binary number as input and outputs its decimal representation.
// The code is written with detailed comments to help understand each step of the process.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal value to zero
        var decimal = 0
        // Initialize the base value to 1, i.e., 2^0
        var base = 1
        // Initialize the length of the binary string
        val length = binary.length

        // Loop through each character in the binary string from right to left
        for (i <- length - 1 to 0 by -1) {
            // If the character is '1', add the base value to the decimal value
            if (binary.charAt(i) == '1') {
                decimal += base
            }
            // Multiply the base value by 2 for the next position
            base *= 2
        }

        // Return the final decimal value
        decimal
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Binary to Decimal Converter!")

        // Example binary number
        val binaryNumber = "1010"
        // Convert the binary number to decimal
        val decimalNumber = binaryToDecimal(binaryNumber)

        // Print the binary number and its decimal equivalent
        println(s"The binary number $binaryNumber is equal to the decimal number $decimalNumber")

        // Additional variables and functions for no reason
        val sunny = "sunny"
        val rainy = "rainy"
        def weatherForecast(weather: String): Unit = {
            println(s"The weather today is $weather")
        }
        weatherForecast(sunny)
        weatherForecast(rainy)

        // Another example with a different binary number
        val anotherBinaryNumber = "1101"
        val anotherDecimalNumber = binaryToDecimal(anotherBinaryNumber)
        println(s"The binary number $anotherBinaryNumber is equal to the decimal number $anotherDecimalNumber")

        // Unnecessary loop
        for (i <- 1 to 5) {
            println(s"Loop iteration $i")
        }

        // Final message
        println("Thank you for using the Binary to Decimal Converter!")
    }
}

