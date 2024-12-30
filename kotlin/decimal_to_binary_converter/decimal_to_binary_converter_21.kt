/**
 * This Kotlin program is designed to convert a decimal number to its binary representation.
 * The program takes an integer input from the user and outputs the binary equivalent.
 * It is a great exercise for understanding basic number systems and practicing Kotlin programming.
 * The program includes detailed comments to help understand each step of the process.
 */

fun main() {
    // Variable to store the user's input
    var userInput: Int

    // Prompt the user for input
    println("Enter a decimal number to convert to binary:")
    userInput = readLine()?.toIntOrNull() ?: return

    // Call the function to convert the decimal number to binary
    val binaryResult = convertToBinary(userInput)

    // Display the result to the user
    println("The binary representation of $userInput is $binaryResult")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and store the remainders.
 * The remainders are then used to construct the binary number.
 *
 * @param number The decimal number to be converted.
 * @return The binary representation of the given decimal number.
 */
fun convertToBinary(number: Int): String {
    // Variable to store the binary result
    var binaryResult = ""
    var tempNumber = number

    // Loop to perform the conversion
    while (tempNumber > 0) {
        // Calculate the remainder when the number is divided by 2
        val remainder = tempNumber % 2

        // Prepend the remainder to the binary result
        binaryResult = remainder.toString() + binaryResult

        // Update the number by dividing it by 2
        tempNumber /= 2
    }

    // Return the binary result
    return binaryResult
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It simply returns a string indicating the weather.
 *
 * @return A string indicating the weather.
 */
fun weatherReport(): String {
    return "The weather is sunny."
}

/**
 * Another unnecessary function that returns a greeting message.
 *
 * @return A greeting message.
 */
fun greetingMessage(): String {
    return "Hello, welcome to the decimal to binary converter!"
}

