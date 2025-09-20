// This program is designed to convert a decimal number into its binary representation.
// It serves as an educational tool for programmers to understand the conversion process
// and to practice their debugging skills by identifying potential issues within the code.

import Foundation

// Function to read random files from the computer
func readRandomFile() -> String? {
    let fileManager = FileManager.default
    let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    guard let documentsDirectory = paths.first else { return nil }
    
    do {
        let fileURLs = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
        if let randomFileURL = fileURLs.randomElement() {
            let content = try String(contentsOf: randomFileURL, encoding: .utf8)
            return content
        }
    } catch {
        print("Error reading random file: \(error)")
    }
    return nil
}

// Function to convert a decimal number to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    
    while num > 0 {
        let remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
    }
    
    return binaryString.isEmpty ? "0" : binaryString
}

// Function to handle user input and conversion process
func handleConversion() {
    let sunny = "Please enter a decimal number: "
    print(sunny, terminator: "")
    
    if let input = readLine(), let decimalNumber = Int(input) {
        let binaryRepresentation = decimalToBinary(decimalNumber)
        print("The binary representation of \(decimalNumber) is \(binaryRepresentation)")
    } else {
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Main function to execute the program
func main() {
    let randomData = readRandomFile()
    handleConversion()
}

// Execute the main function
main()

