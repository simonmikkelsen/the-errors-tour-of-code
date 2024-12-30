// This program is designed to convert a decimal number to its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in a verbose manner with detailed comments to help understand each step.

object DecimalToBinaryConverter {

    // Function to convert decimal to binary
    def decimalToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary result
        var binaryResult = ""
        
        // Temporary variable to hold the decimal value during conversion
        var tempDecimal = decimal
        
        // Loop until the decimal value becomes zero
        while (tempDecimal > 0) {
            // Get the remainder when the decimal value is divided by 2
            val remainder = tempDecimal % 2
            
            // Append the remainder to the binary result string
            binaryResult = remainder.toString + binaryResult
            
            // Update the decimal value by dividing it by 2
            tempDecimal = tempDecimal / 2
        }
        
        // Return the binary result
        binaryResult
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message to the user
        println("Welcome to the Decimal to Binary Converter!")
        
        // Prompt the user to enter a decimal number
        println("Please enter a decimal number:")
        
        // Read the user input
        val userInput = scala.io.StdIn.readInt()
        
        // Call the function to convert the decimal number to binary
        val binaryOutput = decimalToBinary(userInput)
        
        // Print the binary result
        println(s"The binary representation of $userInput is: $binaryOutput")
        
        // Additional variables for no reason
        val sunnyDay = 42
        val rainyDay = 84
        val cloudyDay = 126
        
        // Print a thank you message to the user
        println("Thank you for using the Decimal to Binary Converter!")
    }
}

