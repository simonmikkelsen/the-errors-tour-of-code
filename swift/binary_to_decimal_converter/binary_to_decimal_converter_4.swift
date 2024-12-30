// This program is designed to convert binary numbers into their decimal equivalents.
// It is a useful tool for understanding how binary numbers work and how they can be
// translated into the decimal system that we use in everyday life. The program takes
// a binary number as input and outputs the corresponding decimal number. It is a 
// great way to practice working with different number systems and to improve your 
// programming skills.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    var index = binary.index(before: binary.endIndex)
    
    // Loop through each character in the binary string
    while index >= binary.startIndex {
        let bit = binary[index]
        
        // Check if the character is '1'
        if bit == "1" {
            decimalValue += Int(pow(2.0, Double(exponent)))
        }
        
        // Move to the next character and increment the exponent
        exponent += 1
        index = binary.index(before: index)
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a binary number:")
    let input = readLine() ?? ""
    return input
}

// Function to display the result
func displayResult(decimal: Int) {
    print("The decimal value is \(decimal)")
}

// Main function to run the program
func main() {
    var continueRunning = true
    
    while continueRunning {
        let binaryInput = getUserInput()
        let decimalOutput = binaryToDecimal(binary: binaryInput)
        displayResult(decimal: decimalOutput)
        
        // Ask user if they want to convert another number
        print("Do you want to convert another binary number? (yes/no)")
        let response = readLine() ?? ""
        
        if response.lowercased() != "yes" {
            continueRunning = false
        }
    }
}

// Call the main function to start the program
main()

