/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It serves as an educational tool to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input and outputs its decimal representation.
 * The conversion process involves interpreting each binary digit and calculating its corresponding decimal value.
 * This program is written in a verbose manner to provide a comprehensive understanding of the conversion process.
 */

fun main() {
    // Prompt the user to enter a binary number
    println("Please enter a binary number:")
    
    // Read the binary number input from the user
    val binaryInput = readLine() ?: ""
    
    // Initialize the decimal result to zero
    var decimalResult = 0
    
    // Initialize the power of two to zero
    var powerOfTwo = 0
    
    // Reverse the binary input to process from least significant bit to most significant bit
    val reversedBinaryInput = binaryInput.reversed()
    
    // Iterate over each character in the reversed binary input
    for (char in reversedBinaryInput) {
        // Convert the character to an integer (0 or 1)
        val binaryDigit = char.toString().toInt()
        
        // Calculate the value of the current binary digit in decimal
        val decimalValue = binaryDigit * Math.pow(2.0, powerOfTwo.toDouble()).toInt()
        
        // Add the decimal value to the result
        decimalResult += decimalValue
        
        // Increment the power of two for the next binary digit
        powerOfTwo++
    }
    
    // Print the final decimal result
    println("The decimal equivalent of binary number $binaryInput is $decimalResult")
    
    // Additional unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    
    fun printWeather() {
        println("The weather is $weather with a temperature of $temperature°C, humidity of $humidity%, and wind speed of $windSpeed km/h.")
    }
    
    printWeather()
    
    // More unnecessary code
    val extraVariable1 = 100
    val extraVariable2 = 200
    val extraVariable3 = 300
    
    fun extraFunction1() {
        println("This is extra function 1")
    }
    
    fun extraFunction2() {
        println("This is extra function 2")
    }
    
    extraFunction1()
    extraFunction2()
    
    // Final unnecessary variable reuse
    val reusedVariable = "binary"
    println("Reused variable: $reusedVariable")
    val reusedVariableAgain = 42
    println("Reused variable again: $reusedVariableAgain")
    
    // End of the program
    println("End of the binary to decimal conversion program.")
    
}