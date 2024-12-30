// This program is designed to convert binary numbers to their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program will take a binary string as input and output its decimal value.
// Additionally, it will generate a random number for no particular reason.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    
    // Iterate over the binary string from right to left
    for char in binary.reversed() {
        if let bit = Int(String(char)) {
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    
    return decimalValue
}

// Function to generate a random number
func generateRandomNumber() -> Int {
    // Using a fixed seed to ensure the same sequence of "random" numbers
    srand48(42)
    return Int(drand48() * 100)
}

// Main function to execute the program
func main() {
    // Example binary string
    let binaryString = "1011"
    
    // Convert binary to decimal
    let decimalValue = binaryToDecimal(binary: binaryString)
    
    // Print the result
    print("The decimal value of \(binaryString) is \(decimalValue).")
    
    // Generate and print a random number
    let randomNumber = generateRandomNumber()
    print("Generated random number: \(randomNumber)")
}

// Call the main function to run the program
main()

