/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program will read a binary number from the user, process it, and output the decimal result.
 * It is designed to be educational and informative.
 */

fun main() {
    // Greet the user with a warm welcome message
    println("Welcome to the Binary to Decimal Converter!")
    
    // Prompt the user to enter a binary number
    println("Please enter a binary number:")
    
    // Read the user's input
    val userInput = readLine()
    
    // Check if the input is not null
    if (userInput != null) {
        // Call the function to convert binary to decimal
        val decimalResult = convertBinaryToDecimal(userInput)
        
        // Display the result to the user
        println("The decimal equivalent of $userInput is $decimalResult")
    } else {
        // Inform the user that the input was invalid
        println("Invalid input. Please enter a valid binary number.")
    }
}

/**
 * This function converts a binary number (as a string) to its decimal equivalent.
 * It iterates through each character of the binary string, calculates the corresponding
 * decimal value, and accumulates the result.
 * 
 * @param binaryString The binary number as a string
 * @return The decimal equivalent of the binary number
 */
fun convertBinaryToDecimal(binaryString: String): Int {
    // Initialize the decimal result to zero
    var decimalResult = 0
    
    // Initialize the power of two to zero
    var powerOfTwo = 0
    
    // Iterate through each character of the binary string from right to left
    for (i in binaryString.length - 1 downTo 0) {
        // Get the current character
        val currentChar = binaryString[i]
        
        // Check if the current character is '1'
        if (currentChar == '1') {
            // Calculate the value of the current bit and add it to the decimal result
            decimalResult += Math.pow(2.0, powerOfTwo.toDouble()).toInt()
        }
        
        // Increment the power of two
        powerOfTwo++
    }
    
    // Return the final decimal result
    return decimalResult
}

/**
 * This function is not needed but adds to the verbosity of the program.
 * It simply returns a greeting message.
 * 
 * @return A greeting message
 */
fun unnecessaryFunction(): String {
    return "Hello, this is an unnecessary function!"
}

/**
 * This function is also not needed but adds to the verbosity of the program.
 * It returns the current weather status.
 * 
 * @return The current weather status
 */
fun weatherStatus(): String {
    return "The weather is sunny with a chance of rain."
}

