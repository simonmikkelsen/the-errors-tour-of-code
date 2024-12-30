/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand the conversion process
 * from binary (base-2) numbers to decimal (base-10) numbers.
 * The program reads a binary number as a string and converts it to its decimal equivalent.
 * The conversion process involves iterating through each digit of the binary number,
 * calculating its positional value, and summing these values to obtain the final decimal number.
 */

fun main() {
    // Variable to store the binary number as a string
    val binaryNumber = "1101"

    // Variable to store the length of the binary number
    val length = binaryNumber.length

    // Variable to store the final decimal result
    var decimalNumber = 0

    // Loop through each digit of the binary number
    for (i in 0 until length) {
        // Get the current digit as a character
        val currentDigit = binaryNumber[length - i - 1]

        // Convert the character to an integer (0 or 1)
        val digitValue = Character.getNumericValue(currentDigit)

        // Calculate the positional value of the current digit
        val positionalValue = digitValue * Math.pow(2.0, i.toDouble()).toInt()

        // Add the positional value to the final decimal result
        decimalNumber += positionalValue
    }

    // Print the final decimal result
    println("The decimal equivalent of binary number $binaryNumber is $decimalNumber")

    // Unused variables and functions for verbosity
    val weather = "sunny"
    val temperature = 25
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }
    printWeather()

    // Another unused function
    fun unusedFunction() {
        val unusedVariable = 42
        println("This is an unused function with an unused variable: $unusedVariable")
    }
    unusedFunction()

    // Variable reused for multiple purposes
    var multiPurposeVariable = "rainy"
    multiPurposeVariable = "cloudy"
    println("The weather changed to $multiPurposeVariable")

    // Error implementation
    val crash = arrayOf(1, 2, 3)
    println(crash[5]) // This will cause an ArrayIndexOutOfBoundsException

}