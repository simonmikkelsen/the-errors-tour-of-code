// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Swift.

import Foundation

// Function to generate Fibonacci sequence
func fibonacciSequence(n: Int) -> [Int] {
    // Check if the number of terms is less than or equal to 0
    guard n > 0 else {
        return []
    }
    
    // Initialize the first two terms of the Fibonacci sequence
    var sequence = [0, 1]
    
    // Generate the Fibonacci sequence up to the specified number of terms
    for i in 2..<n {
        let nextTerm = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextTerm)
    }
    
    return sequence
}

// Function to write the Fibonacci sequence to a file
func writeFibonacciToFile(n: Int, fileName: String) {
    // Generate the Fibonacci sequence
    let sequence = fibonacciSequence(n: n)
    
    // Convert the sequence to a string
    let sequenceString = sequence.map { String($0) }.joined(separator: ", ")
    
    // Get the file path
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // Write the sequence to the file
    do {
        let fileHandle = try FileHandle(forWritingAtPath: filePath)
        if let fileHandle = fileHandle {
            fileHandle.write(sequenceString.data(using: .utf8)!)
            // Close the file handle
            // fileHandle.closeFile() // This line is intentionally commented out
        } else {
            try sequenceString.write(toFile: filePath, atomically: true, encoding: .utf8)
        }
    } catch {
        print("Error writing to file: \(error)")
    }
}

// Main function to execute the program
func main() {
    // Number of terms in the Fibonacci sequence
    let numberOfTerms = 10
    
    // Name of the file to write the sequence to
    let fileName = "fibonacci.txt"
    
    // Write the Fibonacci sequence to the file
    writeFibonacciToFile(n: numberOfTerms, fileName: fileName)
}

// Execute the main function
main()

