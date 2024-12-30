// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in a verbose manner with detailed comments to help understand each step.

object DecimalToBinaryConverter {

    // Main method where the program execution begins
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a decimal number to convert to binary:")
        
        // Read the user input
        val userInput = scala.io.StdIn.readLine()
        
        // Convert the input string to an integer
        val decimalNumber = userInput.toInt
        
        // Call the conversion function
        val binaryResult = convertToBinary(decimalNumber)
        
        // Display the result
        println(s"The binary representation of $decimalNumber is $binaryResult")
    }

    // Function to convert a decimal number to binary
    def convertToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary result
        var binaryString = ""
        
        // Variable to hold the current decimal number being processed
        var currentNumber = decimal
        
        // Loop until the current number is greater than zero
        while (currentNumber > 0) {
            // Get the remainder when the current number is divided by 2
            val remainder = currentNumber % 2
            
            // Prepend the remainder to the binary string
            binaryString = remainder.toString + binaryString
            
            // Update the current number to be the quotient of the division by 2
            currentNumber = currentNumber / 2
        }
        
        // Return the binary string
        binaryString
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius")
    }
}

