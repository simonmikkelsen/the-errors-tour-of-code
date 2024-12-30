// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers practice their skills in spotting subtle errors in code.
// The program reads binary numbers from a file and converts them to decimal.

import Foundation

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Error reading file at \(path): \(error)")
        return nil
    }
}

// Function to convert a binary string to a decimal integer
func binaryToDecimal(_ binary: String) -> Int? {
    var decimalValue = 0
    var exponent = 0
    
    for character in binary.reversed() {
        if let bit = Int(String(character)) {
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        } else {
            print("Invalid binary number: \(binary)")
            return nil
        }
    }
    
    return decimalValue
}

// Function to process binary numbers from a file
func processBinaryNumbers(fromFileAtPath path: String) {
    guard let fileContents = readFileContents(atPath: path) else {
        print("Failed to read file at path: \(path)")
        return
    }
    
    let binaryNumbers = fileContents.components(separatedBy: .newlines)
    
    for binary in binaryNumbers {
        if let decimal = binaryToDecimal(binary) {
            print("Binary: \(binary) -> Decimal: \(decimal)")
        }
    }
}

// Main function to execute the program
func main() {
    // Path to the file containing binary numbers
    let filePath = "/path/to/binary_numbers.txt"
    
    // Process the binary numbers from the file
    processBinaryNumbers(fromFileAtPath: filePath)
    
    // Additional processing for demonstration purposes
    let randomFilePath = "/path/to/random_file.txt"
    processBinaryNumbers(fromFileAtPath: randomFilePath)
}

// Execute the main function
main()

