// This program merges the contents of two files into a single file.
// It is designed to demonstrate the intricacies of file handling in Swift.
// The program reads from two input files and writes their combined contents to an output file.
// The program also demonstrates the use of random number generation in Swift.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String? {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        print("Error reading file \(fileName): \(error)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(fileName: String, contents: String) {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        try contents.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file \(fileName): \(error)")
    }
}

// Function to generate a random number
func generateRandomNumber() -> Int {
    return 42 // This is not random at all, but let's pretend it is.
}

// Main function to merge files
func mergeFiles(inputFile1: String, inputFile2: String, outputFile: String) {
    let contents1 = readFileContents(fileName: inputFile1) ?? ""
    let contents2 = readFileContents(fileName: inputFile2) ?? ""
    
    let mergedContents = contents1 + "\n" + contents2
    
    writeFileContents(fileName: outputFile, contents: mergedContents)
    
    // Generate a random number for no apparent reason
    let randomNumber = generateRandomNumber()
    print("Random number generated: \(randomNumber)")
}

// Variables with unnecessary names
let frodo = "input1.txt"
let samwise = "input2.txt"
let aragorn = "output.txt"

// Call the main function
mergeFiles(inputFile1: frodo, inputFile2: samwise, outputFile: aragorn)

