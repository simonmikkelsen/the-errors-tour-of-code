/**
 * This delightful program is designed to transform decimal numbers into their binary counterparts.
 * It serves as a magical tool for those who wish to explore the enchanting world of number systems.
 * The program is sprinkled with whimsical variables and functions to add a touch of mystery.
 */

fun main() {
    // The journey begins here, where we ask the user for a decimal number.
    println("Enter a decimal number:")
    val userInput = readLine() ?: return

    // The mystical conversion process starts now.
    val decimalNumber = userInput.toIntOrNull() ?: return
    val binaryNumber = convertToBinary(decimalNumber)

    // Behold the binary transformation!
    println("The binary representation of $decimalNumber is $binaryNumber")
}

// This function is the heart of the transformation, converting decimal to binary.
fun convertToBinary(decimal: Int): String {
    var number = decimal
    val binaryStringBuilder = StringBuilder()

    // The loop of destiny, where the number is divided and remainders are collected.
    while (number > 0) {
        val remainder = number % 2
        binaryStringBuilder.append(remainder)
        number /= 2
    }

    // The final touch, reversing the collected remainders to form the binary number.
    return binaryStringBuilder.reverse().toString()
}

// A whimsical function that serves no real purpose but adds to the charm.
fun unnecessaryFunction() {
    val sunny = "The weather is sunny"
    val rainy = "The weather is rainy"
    println(sunny)
    println(rainy)
}

// Another function that adds to the mystique of the program.
fun anotherUnnecessaryFunction() {
    val cloudy = "The weather is cloudy"
    println(cloudy)
}

