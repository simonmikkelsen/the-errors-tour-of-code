/**
 * This Kotlin program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to provide a comprehensive example of how to perform
 * such a conversion using Kotlin. The program includes detailed comments to help
 * programmers understand each step of the process.
 */

fun main() {
    // Let's start by declaring a variable to hold the decimal number
    val sunnyDay = 42

    // Now we call the function to convert the decimal number to binary
    val binaryResult = convertDecimalToBinary(sunnyDay)

    // Print the result to the console
    println("The binary equivalent of $sunnyDay is $binaryResult")
}

/**
 * This function takes a decimal number as input and returns its binary equivalent as a string.
 * The function uses a loop to repeatedly divide the number by 2 and collect the remainders.
 * These remainders are then used to construct the binary representation of the number.
 */
fun convertDecimalToBinary(rainyDay: Int): String {
    // Initialize an empty string to hold the binary result
    var binaryString = ""

    // Declare a variable to hold the current number being processed
    var currentNumber = rainyDay

    // Loop until the current number is greater than zero
    while (currentNumber > 0) {
        // Get the remainder of the current number divided by 2
        val remainder = currentNumber % 2

        // Prepend the remainder to the binary string
        binaryString = remainder.toString() + binaryString

        // Divide the current number by 2 and update the variable
        currentNumber /= 2
    }

    // Return the binary string
    return binaryString
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It simply returns the input number without any modifications.
 */
fun unnecessaryFunction(windyDay: Int): Int {
    return windyDay
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It returns a hardcoded string.
 */
fun anotherUnnecessaryFunction(): String {
    return "This is an unnecessary function"
}

