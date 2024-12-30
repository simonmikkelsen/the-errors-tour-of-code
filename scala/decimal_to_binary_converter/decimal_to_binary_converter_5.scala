// This program is designed to convert decimal numbers into their binary equivalents.
// It is intended to help programmers understand the process of conversion and 
// to practice their skills in Scala programming. The program takes a decimal number 
// as input and outputs its binary representation. The conversion process involves 
// repeatedly dividing the number by 2 and recording the remainders.

object DecimalToBinaryConverter {

    // Function to convert decimal to binary
    def decimalToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary result
        var binaryResult = ""
        
        // Initialize a variable to hold the current number being processed
        var currentNumber = decimal
        
        // Loop until the current number is greater than 0
        while (currentNumber > 0) {
            // Calculate the remainder when the current number is divided by 2
            val remainder = currentNumber % 2
            
            // Add the remainder to the binary result string
            binaryResult = remainder.toString + binaryResult
            
            // Update the current number by dividing it by 2
            currentNumber = currentNumber / 2
        }
        
        // Return the binary result
        binaryResult
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Decimal to Binary Converter!")
        
        // Prompt the user to enter a decimal number
        println("Please enter a decimal number:")
        
        // Read the user's input
        val input = scala.io.StdIn.readLine()
        
        // Convert the input to an integer
        val decimalNumber = input.toInt
        
        // Call the function to convert the decimal number to binary
        val binaryNumber = decimalToBinary(decimalNumber)
        
        // Print the binary result
        println(s"The binary representation of $decimalNumber is $binaryNumber")
    }
}

