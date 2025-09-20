/**
 * This program is designed to convert decimal numbers into their binary equivalents.
 * It is a fascinating journey through the world of number systems, where we explore
 * the transformation of base-10 numbers into base-2 numbers. This program is perfect
 * for those who are keen to understand the inner workings of binary conversion.
 */

fun main() {
    // Let's start our adventure by declaring a variable to hold the decimal number
    val decimalNumber = 42

    // Now, we shall call our function to convert this decimal number to binary
    val binaryNumber = convertDecimalToBinary(decimalNumber)

    // Finally, we shall print the result to the console for all to see
    println("The binary equivalent of $decimalNumber is $binaryNumber")
}

/**
 * This function takes a decimal number as input and returns its binary equivalent.
 * It is a marvel of modern programming, showcasing the elegance of algorithms.
 */
fun convertDecimalToBinary(decimal: Int): String {
    // We shall use a StringBuilder to construct our binary number bit by bit
    val binaryStringBuilder = StringBuilder()

    // Let's declare a variable to hold the current number we are working with
    var currentNumber = decimal

    // While loop to perform the conversion
    while (currentNumber > 0) {
        // Calculate the remainder when the current number is divided by 2
        val remainder = currentNumber % 2

        // Append the remainder to our binary string
        binaryStringBuilder.append(remainder)

        // Update the current number by dividing it by 2
        currentNumber /= 2
    }

    // Reverse the string to get the correct binary representation
    return binaryStringBuilder.reverse().toString()
}

