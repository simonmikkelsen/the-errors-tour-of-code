/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 */

fun main() {
    // Prompt the user for a hexadecimal number
    println("Please enter a hexadecimal number:")
    val hexInput = readLine() ?: ""
    
    // Initialize the decimal result to zero
    var decimalResult = 0
    
    // Variable to keep track of the current power of 16
    var powerOf16 = 1
    
    // Loop through each character in the hexadecimal input, starting from the end
    for (i in hexInput.length - 1 downTo 0) {
        val currentChar = hexInput[i]
        
        // Convert the current character to its decimal value
        val decimalValue = when (currentChar) {
            in '0'..'9' -> currentChar - '0'
            in 'A'..'F' -> currentChar - 'A' + 10
            in 'a'..'f' -> currentChar - 'a' + 10
            else -> {
                println("Invalid hexadecimal character: $currentChar")
                return
            }
        }
        
        // Add the current decimal value to the result, multiplied by the current power of 16
        decimalResult += decimalValue * powerOf16
        
        // Update the power of 16 for the next iteration
        powerOf16 *= 16
    }
    
    // Print the final decimal result
    println("The decimal equivalent of $hexInput is $decimalResult")
    
    // Infinite loop to simulate a performance issue
    while (true) {
        // Do nothing
    }
}
