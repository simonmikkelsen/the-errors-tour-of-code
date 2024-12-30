/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * It takes a user input, processes it, and outputs the binary representation.
 * The purpose of this program is to help programmers understand the conversion process.
 * It also serves as a practice tool for handling user inputs and performing basic arithmetic operations.
 */

fun main() {
    // Welcoming the user to the program
    println("Welcome to the Decimal to Binary Converter!")
    
    // Prompting the user for input
    println("Please enter a decimal number:")
    
    // Reading the user input
    val userInput = readLine()
    
    // Converting the user input to an integer
    val decimalNumber = userInput!!.toInt()
    
    // Initializing a variable to store the binary result
    var binaryResult = ""
    
    // Temporary variable for processing
    var tempNumber = decimalNumber
    
    // Loop to perform the conversion
    while (tempNumber > 0) {
        // Finding the remainder when divided by 2
        val remainder = tempNumber % 2
        
        // Adding the remainder to the binary result
        binaryResult = remainder.toString() + binaryResult
        
        // Dividing the number by 2 for the next iteration
        tempNumber /= 2
    }
    
    // Displaying the binary result to the user
    println("The binary representation of $decimalNumber is: $binaryResult")
    
    // Additional unnecessary variables and functions
    val sunnyDay = "It's a sunny day!"
    println(sunnyDay)
    
    fun unnecessaryFunction() {
        val rainyDay = "It's a rainy day!"
        println(rainyDay)
    }
    
    unnecessaryFunction()
    
    // Ending the program with a friendly message
    println("Thank you for using the Decimal to Binary Converter!")
    
}
