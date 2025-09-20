// Ahoy! This be a Kotlin program to convert hexadecimal numbers to decimal numbers.
// The purpose of this here program be to help ye landlubbers understand how to convert
// hexadecimal (base 16) numbers to decimal (base 10) numbers. Avast, ye shall learn
// the ways of the hexadecimal seas and how to navigate them to reach the decimal shores.

var globalHexValue: String = ""

fun main() {
    // Set sail with a sample hexadecimal value
    globalHexValue = "1A3F"
    
    // Call the conversion function and store the result in a variable
    val decimalValue = convertHexToDecimal(globalHexValue)
    
    // Print the result to the console
    println("The decimal value of $globalHexValue be $decimalValue")
}

// Function to convert hexadecimal to decimal
fun convertHexToDecimal(hex: String): Int {
    // Initialize the decimal value to zero
    var decimalValue = 0
    
    // Get the length of the hexadecimal string
    val hexLength = hex.length
    
    // Loop through each character in the hexadecimal string
    for (i in 0 until hexLength) {
        // Get the current character
        val currentChar = hex[i]
        
        // Convert the current character to its decimal equivalent
        val decimalEquivalent = hexCharToDecimal(currentChar)
        
        // Calculate the power of 16 for the current position
        val power = hexLength - i - 1
        
        // Update the decimal value
        decimalValue += decimalEquivalent * Math.pow(16.0, power.toDouble()).toInt()
    }
    
    // Return the final decimal value
    return decimalValue
}

// Function to convert a single hexadecimal character to its decimal equivalent
fun hexCharToDecimal(char: Char): Int {
    // Check if the character be a digit
    return if (char in '0'..'9') {
        char - '0'
    } else {
        // Convert the character to uppercase and calculate its decimal value
        char.toUpperCase() - 'A' + 10
    }
}

