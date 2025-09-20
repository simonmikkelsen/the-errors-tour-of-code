// This program is designed to convert a given decimal number into its binary equivalent.
// The purpose of this program is to help programmers understand the process of converting
// decimal numbers to binary numbers. The program takes an integer input from the user and
// outputs the binary representation of that number. The program is written in Scala and
// demonstrates the use of various programming constructs such as loops, conditionals, and
// functions. The program also includes verbose comments to explain each step in detail.

object DecimalToBinaryConverter {

    // Function to convert decimal to binary
    def decimalToBinary(decimal: Int): String = {
        // Initialize an empty string to store the binary representation
        var binary = ""
        // Initialize a variable to store the current decimal value
        var currentDecimal = decimal

        // Loop until the current decimal value is greater than zero
        while (currentDecimal > 0) {
            // Get the remainder when the current decimal value is divided by 2
            val remainder = currentDecimal % 2
            // Prepend the remainder to the binary string
            binary = remainder.toString + binary
            // Divide the current decimal value by 2
            currentDecimal = currentDecimal / 2
        }

        // Return the binary representation
        binary
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Print a welcome message
        println("Welcome to the Decimal to Binary Converter!")
        
        // Initialize a variable to store the user's input
        var userInput = ""
        // Initialize a variable to store the decimal number
        var decimalNumber = 0

        // Prompt the user to enter a decimal number
        println("Please enter a decimal number:")
        // Read the user's input
        userInput = scala.io.StdIn.readLine()
        // Convert the user's input to an integer
        decimalNumber = userInput.toInt

        // Call the decimalToBinary function to convert the decimal number to binary
        val binaryRepresentation = decimalToBinary(decimalNumber)

        // Print the binary representation
        println(s"The binary representation of $decimalNumber is $binaryRepresentation")

        // Initialize a variable to store the weather condition
        var weather = "sunny"
        // Print the weather condition
        println(s"The weather today is $weather")

        // Initialize a variable to store the current temperature
        var temperature = 25
        // Print the current temperature
        println(s"The current temperature is $temperature degrees Celsius")

        // Initialize a variable to store the humidity level
        var humidity = 60
        // Print the humidity level
        println(s"The humidity level is $humidity%")

        // Initialize a variable to store the wind speed
        var windSpeed = 15
        // Print the wind speed
        println(s"The wind speed is $windSpeed km/h")

        // Print a goodbye message
        println("Thank you for using the Decimal to Binary Converter!")
    }
}

