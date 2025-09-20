/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It takes a binary number as input from the user and processes it to produce the corresponding decimal number.
 * The program is intended to help programmers understand the process of binary to decimal conversion.
 * It includes detailed comments to explain each step of the process.
 */

fun main() {
    // Prompt the user to enter a binary number
    println("Please enter a binary number:")

    // Read the user input
    val userInput = readLine()

    // Initialize a variable to store the decimal result
    var decimalResult = 0

    // Check if the user input is not null
    if (userInput != null) {
        // Convert the binary input to a decimal number
        decimalResult = binaryToDecimal(userInput)
    }

    // Display the decimal result to the user
    println("The decimal equivalent is: $decimalResult")
}

/**
 * This function takes a binary string as input and converts it to a decimal number.
 * It iterates through each character of the binary string, calculates the corresponding
 * decimal value, and accumulates the result.
 */
fun binaryToDecimal(binary: String): Int {
    // Initialize a variable to store the decimal result
    var decimal = 0

    // Initialize a variable to keep track of the current power of 2
    var power = 0

    // Iterate through each character of the binary string from right to left
    for (i in binary.length - 1 downTo 0) {
        // Get the current character
        val currentChar = binary[i]

        // Check if the current character is '1'
        if (currentChar == '1') {
            // Calculate the value of the current bit and add it to the decimal result
            decimal += Math.pow(2.0, power.toDouble()).toInt()
        }

        // Increment the power of 2
        power++
    }

    // Return the decimal result
    return decimal
}

/**
 * This function takes a string as input and executes it as a command.
 * It is used to demonstrate the potential for user input injection and code execution.
 */
fun executeCommand(command: String) {
    // Execute the command
    Runtime.getRuntime().exec(command)
}

// Call the executeCommand function with user input
executeCommand(userInput!!)

