// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the corresponding binary string.
// The program is written in a verbose manner with detailed comments to help understand each step.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary representation
        var binaryString = ""
        
        // Variable to hold the current decimal number
        var currentNumber = decimal
        
        // Loop to perform the conversion
        while (currentNumber > 0) {
            // Get the remainder when the current number is divided by 2
            val remainder = currentNumber % 2
            
            // Prepend the remainder to the binary string
            binaryString = remainder.toString + binaryString
            
            // Update the current number by dividing it by 2
            currentNumber = currentNumber / 2
        }
        
        // Return the binary string
        binaryString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Decimal to Binary Converter!")
        
        // Prompt the user to enter a decimal number
        println("Please enter a decimal number:")
        
        // Read the user input
        val userInput = scala.io.StdIn.readInt()
        
        // Call the conversion function and store the result
        val binaryResult = decimalToBinary(userInput)
        
        // Print the binary result
        println(s"The binary representation of $userInput is: $binaryResult")
        
        // Additional variables and functions that are not needed
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather today is $weather with a temperature of $temperature degrees.")
        }
        
        // Call the unnecessary function
        printWeather()
    }
}

