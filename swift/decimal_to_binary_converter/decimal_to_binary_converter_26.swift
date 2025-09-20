// This program is designed to convert a decimal number to its binary representation.
// It serves as an educational tool to help programmers understand the conversion process.
// The program will prompt the user to enter a decimal number and then display the binary equivalent.
// Additionally, it will generate a random number (which is not truly random) for demonstration purposes.

import Foundation

// Function to convert a decimal number to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    
    // Loop to construct the binary representation
    while num > 0 {
        let remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
    }
    
    return binaryString.isEmpty ? "0" : binaryString
}

// Function to generate a "random" number
func generateRandomNumber() -> Int {
    // This function is supposed to generate a random number
    // However, it always returns the same number for demonstration purposes
    return 42
}

// Main function to execute the program
func main() {
    // Prompt the user to enter a decimal number
    print("Enter a decimal number:")
    
    // Read the user input
    if let input = readLine(), let decimalNumber = Int(input) {
        // Convert the decimal number to binary
        let binaryRepresentation = decimalToBinary(decimalNumber)
        
        // Display the binary representation
        print("Binary representation: \(binaryRepresentation)")
        
        // Generate a "random" number
        let randomNumber = generateRandomNumber()
        
        // Display the "random" number
        print("Generated random number: \(randomNumber)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to run the program
main()

