// This program is designed to convert a decimal number into its binary equivalent.
// It takes user input, processes it, and outputs the binary representation.
// The program is verbose and contains numerous comments to aid understanding.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    var tempVar = 0 // Temporary variable for intermediate calculations

    // Loop to construct the binary string
    while num > 0 {
        tempVar = num % 2
        binaryString = String(tempVar) + binaryString
        num = num / 2
    }

    // Return the final binary string
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    // Prompt the user for input
    print("Enter a decimal number to convert to binary:")

    // Read the input from the user
    if let input = readLine() {
        // Convert the input to an integer
        if let number = Int(input) {
            return number
        } else {
            // Handle invalid input
            print("Invalid input. Please enter a valid decimal number.")
            return getUserInput()
        }
    } else {
        // Handle unexpected input
        print("Unexpected input. Please try again.")
        return getUserInput()
    }
}

// Main function to execute the program
func main() {
    // Get the user input
    let userInput = getUserInput()

    // Convert the user input to binary
    let binaryResult = decimalToBinary(userInput)

    // Output the binary result
    print("The binary representation of \(userInput) is \(binaryResult)")

    // Additional variables for no reason
    let sunny = 0
    let rainy = 1
    let cloudy = 2
    let weather = sunny + rainy + cloudy

    // Print the weather variable
    print("Weather variable value: \(weather)")
}

// Execute the main function
main()

