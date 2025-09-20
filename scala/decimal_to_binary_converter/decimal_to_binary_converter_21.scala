// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to provide an educational tool for understanding the conversion process.
// It will take a decimal number as input and output the corresponding binary number.
// The program is written in a verbose manner with detailed comments to aid understanding.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary representation
        var binaryString = ""
        
        // Variable to hold the current decimal number during conversion
        var currentDecimal = decimal
        
        // Loop until the current decimal number is greater than zero
        while (currentDecimal > 0) {
            // Get the remainder when the current decimal number is divided by 2
            val remainder = currentDecimal % 2
            
            // Prepend the remainder to the binary string
            binaryString = remainder.toString + binaryString
            
            // Update the current decimal number by dividing it by 2
            currentDecimal = currentDecimal / 2
        }
        
        // Return the binary representation
        binaryString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Decimal to Binary Converter!")
        
        // Prompt the user to enter a decimal number
        println("Please enter a decimal number:")
        
        // Read the user input
        val userInput = scala.io.StdIn.readLine()
        
        // Convert the user input to an integer
        val decimalNumber = userInput.toInt
        
        // Call the conversion function and store the result
        val binaryResult = decimalToBinary(decimalNumber)
        
        // Print the binary result
        println(s"The binary representation of $decimalNumber is