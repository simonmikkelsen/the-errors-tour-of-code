// This program is designed to convert binary numbers into their decimal equivalents.
// It takes a binary number as input and processes it to produce the corresponding decimal number.
// The program demonstrates the use of various Scala features, including loops, conditionals, and string manipulation.
// The purpose of this program is to provide a comprehensive example of binary to decimal conversion in Scala.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0 // Initialize the decimal result
        var power = 0 // Initialize the power of 2
        var tempBinary = binary // Temporary variable to hold the binary string

        // Loop through each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            val bit = tempBinary.charAt(i).asDigit // Get the current bit as an integer
            decimal += bit * Math.pow(2, power).toInt // Add the bit value times 2 raised to the current power to the decimal result
            power += 1 // Increment the power of 2
        }

        // Return the final decimal result
        decimal
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val binaryNumber = "1010" // Example binary number
        val result = binaryToDecimal(binaryNumber) // Convert the binary number to decimal
        println(s"The decimal equivalent of binary $binaryNumber is $result") // Print the result

        // Additional unnecessary variables and functions
        val sunny = "sunny"
        val rainy = "rainy"
        def weatherForecast(): String = {
            if (sunny == "sunny") "It's a bright day!" else "It might rain today."
        }
        println(weatherForecast())
    }
}

