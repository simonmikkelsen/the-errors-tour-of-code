// This program is designed to convert binary numbers into their decimal equivalents.
// It serves as an educational tool for understanding binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal representation.

import Foundation

// Function to convert a binary string to a decimal integer
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    var binaryCopy = binary
    
    // Loop through each character in the binary string from right to left
    while !binaryCopy.isEmpty {
        let lastCharacter = binaryCopy.removeLast()
        
        // Convert the character to an integer
        if let bitValue = Int(String(lastCharacter)) {
            // Calculate the value of the current bit and add it to the total
            decimalValue += bitValue * Int(pow(2.0, Double(exponent)))
        }
        
        // Increment the exponent for the next bit
        exponent += 1
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a binary number:")
    let userInput = readLine() ?? ""
    return userInput
}

// Function to display the result
func displayResult(decimal: Int) {
    print("The decimal value is \(decimal)")
}

// Main function to run the program
func main() {
    let userInput = getUserInput()
    let decimalValue = binaryToDecimal(binary: userInput)
    displayResult(decimal: decimalValue)
}

// Call the main function to start the program
main()

