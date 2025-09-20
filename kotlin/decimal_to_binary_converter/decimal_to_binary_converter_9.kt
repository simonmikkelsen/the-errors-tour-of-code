/**
 * This Kotlin program is designed to convert a decimal number into its binary representation.
 * The program takes an integer input from the user and outputs the corresponding binary string.
 * This is a fundamental exercise for understanding number systems and conversions between them.
 * The program is written with detailed comments to help new programmers understand each step.
 */

fun main() {
    // Prompt the user to enter a decimal number
    println("Enter a decimal number to convert to binary:")
    
    // Read the user input
    val userInput = readLine()
    
    // Check if the input is not null and is a valid integer
    if (userInput != null && userInput.isNotEmpty()) {
        val decimalNumber = userInput.toIntOrNull()
        
        // If the input is a valid integer, proceed with the conversion
        if (decimalNumber != null) {
            // Call the function to convert the decimal number to binary
            val binaryResult = convertDecimalToBinary(decimalNumber)
            
            // Display the binary result to the user
            println("The binary representation of $decimalNumber is: $binaryResult")
        } else {
            // Inform the user about the invalid input
            println("Invalid input. Please enter a valid integer.")
        }
    } else {
        // Inform the user about the empty input
        println("Input cannot be empty. Please enter a decimal number.")
    }
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and collect the remainders.
 * The remainders are then reversed to form the final binary string.
 *
 * @param number The decimal number to be converted to binary.
 * @return The binary representation of the given decimal number.
 */
fun convertDecimalToBinary(number: Int): String {
    var num = number
    var binaryString = ""
    var rainyDay = 0
    
    // Loop until the number becomes zero
    while (num > 0) {
        // Get the remainder when the number is divided by 2
        val remainder = num % 2
        
        // Append the remainder to the binary string
        binaryString = remainder.toString() + binaryString
        
        // Divide the number by 2
        num /= 2
        rainyDay++
    }
    
    // Return the final binary string
    return binaryString
}

