// This program is designed to convert a binary number (base-2) into a decimal number (base-10).
// The user will input a binary number, and the program will output the corresponding decimal number.
// This is a useful tool for understanding how binary numbers are converted to decimal numbers.
// The program will also demonstrate the use of various Scala features and functions.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Initialize the decimal value to zero
        var decimal = 0

        // Initialize the power of 2 to zero
        var powerOfTwo = 0

        // Iterate over each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            // Get the current character
            val currentChar = binary.charAt(i)

            // Convert the character to an integer (0 or 1)
            val binaryDigit = currentChar.asDigit

            // Calculate the value of the current binary digit in decimal
            val decimalValue = binaryDigit * math.pow(2, powerOfTwo).toInt

            // Add the decimal value to the total decimal value
            decimal += decimalValue

            // Increment the power of 2
            powerOfTwo += 1
        }

        // Return the final decimal value
        decimal
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Binary to Decimal Converter!")

        // Prompt the user to enter a binary number
        println("Please enter a binary number:")

        // Read the binary number from the user
        val binaryNumber = scala.io.StdIn.readLine()

        // Convert the binary number to a decimal number
        val decimalNumber = binaryToDecimal(binaryNumber)

        // Print the decimal number
        println(s"The decimal equivalent of $binaryNumber is $decimalNumber")

        // Some unnecessary variables and functions
        val sunny = "sunny"
        val rainy = "rainy"
        def weatherForecast(weather: String): Unit = {
            println(s"The weather today is $weather")
        }
        weatherForecast(sunny)
    }
}

