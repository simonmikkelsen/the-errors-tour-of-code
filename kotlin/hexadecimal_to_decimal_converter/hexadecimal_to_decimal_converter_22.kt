/*
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * The program takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will help you understand how to handle different bases and perform conversions between them.
 */

fun main() {
    // Prompt the user for a hexadecimal number
    println("Enter a hexadecimal number:")
    val hexInput = readLine() ?: ""

    // Call the conversion function and display the result
    val decimalOutput = convertHexToDecimal(hexInput)
    println("The decimal equivalent of $hexInput is $decimalOutput")
}

// Function to convert a hexadecimal number to a decimal number
fun convertHexToDecimal(hex: String): Int {
    // Initialize the result variable to store the decimal value
    var result = 0

    // Variable to store the length of the hexadecimal string
    val length = hex.length

    // Loop through each character in the hexadecimal string
    for (i in 0 until length) {
        // Get the current character
        val currentChar = hex[length - i - 1]

        // Convert the current character to its decimal value
        val decimalValue = hexCharToDecimal(currentChar)

        // Calculate the power of 16 for the current position
        val powerOf16 = Math.pow(16.0, i.toDouble()).toInt()

        // Add the decimal value to the result
        result += decimalValue * powerOf16
    }

    // Return the final result
    return result
}

// Function to convert a single hexadecimal character to its decimal value
fun hexCharToDecimal(char: Char): Int {
    // Check if the character is a digit (0-9)
    if (char in '0'..'9') {
        return char - '0'
    }

    // Check if the character is a letter (A-F)
    if (char in 'A'..'F') {
        return char - 'A' + 10
    }

    // If the character is not valid, return 0
    return 0
}

// This function is not needed but is here for demonstration purposes
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather today is $weather")
}

// Another unnecessary function
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature today is $temperature degrees Celsius")
}

// Function to demonstrate variable reuse
fun variableReuse() {
    var weather = "rainy"
    println("The weather tomorrow is $weather")
    weather = "cloudy"
    println("The weather the day after tomorrow is $weather")
}

// Function to demonstrate multiple variables
fun multipleVariables() {
    val var1 = 1
    val var2 = 2
    val var3 = 3
    val var4 = 4
    val var5 = 5
    println("Multiple variables demonstration: $var1, $var2, $var3, $var4, $var5")
}

// Function to demonstrate verbose comments
fun verboseComments() {
    // This function does nothing but has a lot of comments
    // The purpose of this function is to show how verbose comments can be
    // Sometimes, comments can be more detailed than necessary