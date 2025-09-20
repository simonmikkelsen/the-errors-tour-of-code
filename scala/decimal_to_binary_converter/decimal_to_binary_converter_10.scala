// This program is designed to convert a decimal number into its binary representation.
// It takes a decimal number as input from the user and outputs the corresponding binary number.
// The program is written in Scala and demonstrates basic input/output operations, 
// as well as the conversion logic from decimal to binary.

object DecimalToBinaryConverter {

    // Function to convert a decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        var binary = ""
        var num = decimal
        while (num > 0) {
            binary = (num % 2).toString + binary
            num = num / 2
        }
        binary
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a decimal number
        println("Enter a decimal number to convert to binary:")
        
        // Read the user input
        val userInput = scala.io.StdIn.readLine()
        
        // Convert the user input to an integer
        val decimalNumber = userInput.toInt
        
        // Call the conversion function
        val binaryNumber = decimalToBinary(decimalNumber)
        
        // Output the binary number
        println(s"The binary representation of $decimalNumber is $binaryNumber")
    }
}

