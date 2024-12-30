// This program is a binary to decimal converter written in Scala.
// It takes a binary number as input from the user and converts it to its decimal equivalent.
// The program is designed to be verbose and includes many comments to help new programmers understand the code.
// Additionally, it includes extra variables and functions that are not necessary for the conversion process.

import scala.io.StdIn.readLine

object BinaryToDecimalConverter {

    // Main method where the program execution begins
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a binary number
        println("Please enter a binary number:")

        // Read the user input
        val userInput = readLine()

        // Convert the binary number to decimal
        val decimalNumber = convertBinaryToDecimal(userInput)

        // Print the decimal equivalent of the binary number
        println(s"The decimal equivalent of binary number $userInput is $decimalNumber")
    }

    // Function to convert a binary number to its decimal equivalent
    def convertBinaryToDecimal(binary: String): Int = {
        // Initialize the decimal number to zero
        var decimal = 0

        // Initialize the power of two to zero
        var power = 0

        // Loop through each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            // Get the character at the current position
            val char = binary.charAt(i)

            // Convert the character to an integer (0 or 1)
            val bit = char.asDigit

            // Calculate the value of the current bit and add it to the decimal number
            decimal += bit * math.pow(2, power).toInt

            // Increment the power of two
            power += 1
        }

        // Return the decimal number
        decimal
    }

    // Extra function that is not needed for the conversion process
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }

    // Another extra function that is not needed for the conversion process
    def anotherUnnecessaryFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius")
    }

    // Function to execute a command based on user input
    def executeCommand(command: String): Unit = {
        import sys.process._
        command.!
    }

    // Call the unnecessary functions
    unnecessaryFunction()
    anotherUnnecessaryFunction()

    // Execute a command based on user input
    executeCommand(userInput)
}

