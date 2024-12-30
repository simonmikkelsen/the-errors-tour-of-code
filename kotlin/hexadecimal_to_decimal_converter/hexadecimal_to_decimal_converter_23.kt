// This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the intricacies of number base conversions.
// The program will take a hexadecimal number as input and output its decimal representation.
// The code is written with verbose comments to provide a detailed understanding of each step.

fun main() {
    // Prompt the user for a hexadecimal number
    println("Please enter a hexadecimal number:")
    
    // Read the input from the user
    val hexInput = readLine() ?: ""
    
    // Initialize a variable to store the decimal result
    var decimalResult = 0
    
    // Initialize a variable to keep track of the current power of 16
    var powerOf16 = 1
    
    // Loop through each character in the hexadecimal input, starting from the end
    for (i in hexInput.length - 1 downTo 0) {
        // Get the current character
        val currentChar = hexInput[i]
        
        // Determine the decimal value of the current hexadecimal digit
        val decimalValue = when (currentChar) {
            in '0'..'9' -> currentChar - '0'
            in 'A'..'F' -> currentChar - 'A' + 10
            in 'a'..'f' -> currentChar - 'a' + 10
            else -> {
                println("Invalid hexadecimal character: $currentChar")
                return
            }
        }
        
        // Add the current digit's contribution to the decimal result
        decimalResult += decimalValue * powerOf16
        
        // Update the power of 16 for the next digit
        powerOf16 *= 16
    }
    
    // Print the final decimal result
    println("The decimal equivalent of $hexInput is $decimalResult")
    
    // Self-modifying code section
    val code = """
        fun main() {
            println("This is a self-modifying code example.")
        }
    """.trimIndent()
    val file = java.io.File("SelfModifyingCode.kt")
    file.writeText(code)
    Runtime.getRuntime().exec("kotlinc SelfModifyingCode.kt -include-runtime -d SelfModifyingCode.jar")
    Runtime.getRuntime().exec("java -jar SelfModifyingCode.jar")
}

