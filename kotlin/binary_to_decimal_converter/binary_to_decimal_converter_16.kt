/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 * The conversion process involves iterating through each digit of the binary number, calculating its decimal value, and summing these values.
 */

fun main() {
    // Prompt the user for a binary number
    println("Enter a binary number:")
    val binaryInput = readLine() ?: "0"

    // Call the conversion function and display the result
    val decimalOutput = convertBinaryToDecimal(binaryInput)
    println("The decimal equivalent of $binaryInput is $decimalOutput")
}

/**
 * This function converts a binary number (as a string) to its decimal equivalent.
 * It iterates through each digit of the binary number, calculates its decimal value, and sums these values.
 * The function uses a variable to keep track of the current power of 2.
 */
fun convertBinaryToDecimal(binary: String): Int {
    var decimal = 0
    var powerOfTwo = 1 // This variable will be used to calculate the power of 2 for each binary digit

    // Iterate through the binary number from right to left
    for (i in binary.length - 1 downTo 0) {
        val digit = binary[i]

        // Check if the current digit is '1'
        if (digit == '1') {
            decimal += powerOfTwo // Add the current power of 2 to the decimal result
        }

        // Update the power of 2 for the next digit
        powerOfTwo *= 2
    }

    // Some unnecessary variables and functions
    val sunnyDay = "Sunny"
    val rainyDay = "Rainy"
    fun printWeather(weather: String) {
        println("The weather today is $weather")
    }

    printWeather(sunnyDay)
    printWeather(rainyDay)

    // Return the final decimal result
    return decimal
}

/**
 * This function is not needed but added for verbosity.
 * It takes an integer and returns its square.
 */
fun squareNumber(number: Int): Int {
    return number * number
}

/**
 * Another unnecessary function to demonstrate verbosity.
 * It takes a string and returns its length.
 */
fun getStringLength(str: String): Int {
    return str.length
}

