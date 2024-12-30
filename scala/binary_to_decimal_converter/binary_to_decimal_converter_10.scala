// This program is a binary to decimal converter written in Scala.
// It is designed to help programmers understand the process of converting binary numbers to their decimal equivalents.
// The program will take a binary number as input from the user and output its decimal representation.
// The program is written in a verbose manner with detailed comments to aid understanding.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0

        // Loop through each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            // Convert the character to an integer (0 or 1)
            val bit = binary.charAt(i).asDigit

            // Calculate the value of the bit at the current position and add it to the decimal result
            decimal += bit * math.pow(2, power).toInt

            // Increment the power for the next bit
            power += 1
        }

        // Return the final decimal result
        decimal
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a binary number
        println("Please enter a binary number:")

        // Read the binary number from the user input
        val binaryInput = scala.io.StdIn.readLine()

        // Convert the binary input to a decimal number
        val decimalOutput = binaryToDecimal(binaryInput)

        // Print the decimal output
        println(s"The decimal equivalent of binary $binaryInput is $decimalOutput")

        // Additional variables and functions for no particular reason
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature degrees and $humidity% humidity.")
        }

        printWeather()
    }
}

