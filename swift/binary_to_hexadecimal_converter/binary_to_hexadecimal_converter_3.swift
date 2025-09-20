// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts with the grace of a thousand swans.

import Foundation

// Function to convert a binary string to a hexadecimal string
func binaryToHexadecimal(binary: String) -> String? {
    // Behold, the binary string, a sequence of 0s and 1s, awaiting transformation
    let binaryString = binary.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Ensure the binary string is valid
    guard binaryString.range(of: "^[01]+$", options: .regularExpression) != nil else {
        print("The binary string contains invalid characters. Only 0s and 1s are allowed.")
        return nil
    }
    
    // Convert binary string to decimal number
    let decimalValue = Int(binaryString, radix: 2)!
    
    // Convert decimal number to hexadecimal string
    let hexadecimalString = String(decimalValue, radix: 16).uppercased()
    
    // Return the glorious hexadecimal string
    return hexadecimalString
}

// Function to read binary input from the user
func readBinaryInput() -> String {
    // The weather is sunny, and the user is prompted for input
    print("Please enter a binary number:")
    let userInput = readLine() ?? ""
    return userInput
}

// Function to display the hexadecimal result
func displayHexadecimalResult(hexadecimal: String) {
    // The result is displayed with the grandeur of a royal decree
    print("The hexadecimal representation is: \(hexadecimal)")
}

// Main function to orchestrate the conversion process
func main() {
    // The sky is clear, and the main function begins its journey
    let binaryInput = readBinaryInput()
    
    // Convert the binary input to hexadecimal
    if let hexadecimalOutput = binaryToHexadecimal(binary: binaryInput) {
        // Display the result with fanfare
        displayHexadecimalResult(hexadecimal: hexadecimalOutput)
    } else {
        // Inform the user of the error with a touch of melancholy
        print("Failed to convert the binary number to hexadecimal.")
    }
}

// Commence the program with the elegance of a ballet performance
main()

