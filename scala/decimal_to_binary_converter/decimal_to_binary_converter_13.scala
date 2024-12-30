// Ahoy, matey! This be a program to convert decimal numbers to binary. 
// It be a fine tool for learnin' the ways of the binary seas. 
// Ye'll find yerself sailin' through the waves of bits and bytes, 
// convertin' decimal treasures to binary gold.

object DecimalToBinaryConverter {

    // A global variable to hold the binary result
    var binaryResult: String = ""

    // Function to convert decimal to binary
    def convertToBinary(decimal: Int): String = {
        // Arr, this be the local variable to hold the intermediate result
        var tempDecimal = decimal
        // Clear the global variable before starting the conversion
        binaryResult = ""
        
        // While loop to perform the conversion
        while (tempDecimal > 0) {
            // Get the remainder of the division by 2
            val remainder = tempDecimal % 2
            // Prepend the remainder to the binary result
            binaryResult = remainder.toString + binaryResult
            // Divide the decimal number by 2
            tempDecimal = tempDecimal / 2
        }
        
        // Return the binary result
        binaryResult
    }

    // Function to print the binary result
    def printBinaryResult(): Unit = {
        // Print the binary result to the console
        println("The binary result be: " + binaryResult)
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Arr, here be the decimal number to convert
        val sunnyDay = 42
        // Convert the decimal number to binary
        convertToBinary(sunnyDay)
        // Print the binary result
        printBinaryResult()
    }
}

