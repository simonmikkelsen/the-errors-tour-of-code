/**
 * This Kotlin program is designed to convert binary numbers to their decimal equivalents.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their coding skills.
 * The conversion is done by iterating through each digit of the binary number, calculating its decimal value, and summing these values.
 * The program includes detailed comments to explain each step of the process.
 */

fun main() {
    // The main function is the entry point of the program
    println("Enter a binary number:") // Prompt the user to enter a binary number
    val binaryInput = readLine() // Read the binary number input from the user
    if (binaryInput != null) {
        val decimalOutput = convertBinaryToDecimal(binaryInput) // Convert the binary number to decimal
        println("The decimal equivalent is: $decimalOutput") // Print the decimal equivalent
    } else {
        println("Invalid input. Please enter a valid binary number.") // Handle invalid input
    }
}

/**
 * This function converts a binary number (represented as a string) to its decimal equivalent.
 * It iterates through each digit of the binary number, calculates its decimal value, and sums these values.
 * The function uses a loop to process each digit and a variable to keep track of the current power of 2.
 */
fun convertBinaryToDecimal(binary: String): Int {
    var decimal = 0 // Initialize the decimal result to 0
    var power = 0 // Initialize the power of 2 to 0
    var index = binary.length - 1 // Start from the last digit of the binary number

    while (index >= 0) { // Loop through each digit of the binary number
        val digit = binary[index] // Get the current digit
        if (digit == '1') {
            decimal += Math.pow(2.0, power.toDouble()).toInt() // Calculate the decimal value of the current digit and add it to the result
        }
        power++ // Increment the power of 2
        index-- // Move to the previous digit
    }

    return decimal // Return the decimal result
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string and returns its length.
 */
fun getLength(str: String): Int {
    return str.length
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It takes an integer and returns its square.
 */
fun square(num: Int): Int {
    return num * num
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string and returns it in uppercase.
 */
fun toUpperCase(str: String): String {
    return str.uppercase()
}

