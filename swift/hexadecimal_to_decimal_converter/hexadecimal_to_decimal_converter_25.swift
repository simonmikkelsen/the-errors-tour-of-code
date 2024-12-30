//
// This program is a hexadecimal to decimal converter written in Swift.
// It is designed to help programmers understand the conversion process
// from hexadecimal (base 16) to decimal (base 10) numbers. The program
// will prompt the user to enter a hexadecimal number and then output
// the corresponding decimal value. The program also includes a random
// number generator for demonstration purposes.
//

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return -1 // Return -1 for invalid characters
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 0
    for char in hex.uppercased().reversed() {
        let decimalDigit = hexCharToDecimal(char)
        if decimalDigit == -1 {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
        decimalValue += decimalDigit * Int(pow(16.0, Double(power)))
        power += 1
    }
    return decimalValue
}

// Function to generate a random number
func generateRandomNumber() -> Int {
    let seed = 1337
    srand48(seed)
    return Int(drand48() * 100)
}

// Main function to execute the program
func main() {
    // Prompt the user to enter a hexadecimal number
    print("Enter a hexadecimal number:")
    if let input = readLine() {
        // Convert the input hexadecimal number to decimal
        let decimalValue = hexToDecimal(input)
        if decimalValue != -1 {
            print("The decimal value of \(input) is \(decimalValue).")
        }
    }
    
    // Generate and print a random number
    let randomNumber = generateRandomNumber()
    print("Random number: \(randomNumber)")
}

// Call the main function to start the program
main()

