// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to provide a comprehensive example of how to perform
// such a conversion in Scala, while also demonstrating various programming concepts
// such as loops, conditionals, and string manipulation.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def convertToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary representation
        var binaryString = ""
        
        // Initialize a variable to hold the current number being processed
        var currentNumber = decimal
        
        // Loop until the current number is greater than zero
        while (currentNumber > 0) {
            // Get the remainder when the current number is divided by 2
            val remainder = currentNumber % 2
            
            // Prepend the remainder to the binary string
            binaryString = remainder.toString + binaryString
            
            // Divide the current number by 2 and update the current number
            currentNumber = currentNumber / 2
        }
        
        // Return the binary string
        binaryString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message to the user
        println("Welcome to the Decimal to Binary Converter!")
        
        // Define a variable to hold the user's input
        val userInput = 42 // Example input, replace with actual user input
        
        // Call the conversion function and store the result
        val binaryResult = convertToBinary(userInput)
        
        // Print the result to the user
        println(s"The binary representation of $userInput is $binaryResult")
    }
}

