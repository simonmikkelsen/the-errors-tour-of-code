// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Swift programming skills.
// The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    switch char {
    case "0": return 0
    case "1": return 1
    case "2": return 2
    case "3": return 3
    case "4": return 4
    case "5": return 5
    case "6": return 6
    case "7": return 7
    case "8": return 8
    case "9": return 9
    case "A", "a": return 10
    case "B", "b": return 11
    case "C", "c": return 12
    case "D", "d": return 13
    case "E", "e": return 14
    case "F", "f": return 15
    default: return -1 // Invalid character
    }
}

// Function to convert a hexadecimal string to its decimal value
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 0
    let reversedHex = hex.reversed()
    
    for char in reversedHex {
        let decimalCharValue = hexCharToDecimal(char)
        if decimalCharValue == -1 {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
        decimalValue += decimalCharValue * Int(pow(16.0, Double(power)))
        power += 1
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a hexadecimal number:")
    let userInput = readLine() ?? ""
    return userInput
}

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    let decimalValue = hexToDecimal(userInput)
    
    if decimalValue != -1 {
        print("The decimal value of \(userInput) is \(decimalValue)")
    } else {
        print("Conversion failed due to invalid input.")
    }
}

// Execute the main function
main()

