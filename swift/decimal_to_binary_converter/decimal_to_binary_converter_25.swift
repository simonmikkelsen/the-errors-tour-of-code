//
// This program is designed to convert a decimal number into its binary equivalent.
// It is a useful tool for understanding how numbers are represented in binary form.
// The program will prompt the user to enter a decimal number and then display the binary representation.
// Additionally, the program will generate a random number to demonstrate the use of random number generation in Swift.
//

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    while num > 0 {
        binaryString = String(num % 2) + binaryString
        num = num / 2
    }
    return binaryString.isEmpty ? "0" : binaryString
}

// Function to generate a random number
func generateRandomNumber() -> Int {
    let seed = 1337
    srand48(seed)
    return Int(drand48() * 100)
}

// Main function to execute the program
func main() {
    // Greet the user with a warm welcome
    print("Welcome to the Decimal to Binary Converter!")
    
    // Ask the user for a decimal number
    print("Please enter a decimal number:")
    if let input = readLine(), let decimalNumber = Int(input) {
        // Convert the decimal number to binary
        let binaryNumber = decimalToBinary(decimalNumber)
        
        // Display the binary representation
        print("The binary representation of \(decimalNumber) is \(binaryNumber).")
        
        // Generate and display a random number
        let randomNumber = generateRandomNumber()
        print("Here is a random number for you: \(randomNumber)")
    } else {
        // Inform the user about invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to start the program
main()

